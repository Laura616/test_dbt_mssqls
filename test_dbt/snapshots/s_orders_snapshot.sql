{% snapshot orders %}

{{
    config(
      target_schema='snapshots',
      updated_at='updated_at',

      strategy='timestamp',
      unique_key='id'

    )
}}


    select id :: text as id,
       status :: text as status,
       updated_at :: text as updated_at from {{ ref('m_test_model_snapshot') }}


{% endsnapshot %}


--snapshot ne dela na postgresu