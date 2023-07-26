select * from {{
    metrics.calculate(
        [metric('sum_records_metric'), metric('count_records_metric')],
        grain='day',
        dimensions = ['sale_month']
    )
}}
