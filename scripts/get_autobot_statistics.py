import calendar
from argparse import Namespace
from datetime import datetime
from pprint import pprint
from pydoc import cli

import boto3

client = boto3.client("cloudwatch", region_name="ap-northeast-1")


def get_monthly_savings(dimension_name, year, month):

    last_day_of_month = calendar.monthrange(year, month)[1]
    total_savings = 0

    response = client.get_metric_statistics(
        Namespace="AWSTrustedAdvisorChecks",
        MetricName="cleanup-savings",
        Dimensions=[
            {"Name": "services", "Value": dimension_name},
        ],
        StartTime=datetime(year, month, 1),
        EndTime=datetime(year, month, last_day_of_month),
        Period=86400,
        Statistics=["Sum"],
    )

    for data_point in response["Datapoints"]:
        time_stamp = datetime.strftime(data_point["Timestamp"], "%Y-%m-%d")
        sum = int(data_point["Sum"])
        total_savings += sum
        if sum > 0:
            print(f"{time_stamp}: ${sum:,.0f}")

    return total_savings


if __name__ == "__main__":
    dimensions = ["low-utilization-ebs-checks", "low-utilization-ec2-checks"]
    year = 2023
    month = 1
    month_name = datetime(year, month, 1).strftime("%b")
    last_day_of_month = calendar.monthrange(year, month)[1]
    checks_sum = 0

    for dimension in dimensions:
        sum = get_monthly_savings(dimension_name=dimension, year=year, month=month)
        checks_sum += sum
        print(f"{year}-{month_name} total {dimension} saving: ${sum:,.0f}")

    print(f"{year}-{month_name} 1~{last_day_of_month} total saving: ${checks_sum:,.0f}")
