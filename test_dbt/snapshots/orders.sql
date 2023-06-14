{% snapshot orders_snapshot %}

{{
    config(
      target_schema='snapshots',
      strategy='timestamp',
      unique_key='id',
      updated_at='updated_at',
      invalidate_hard_deletes=True,

    )
}}

select *
       from {{ ref('monthly_scores_incremental') }}

{% endsnapshot %}