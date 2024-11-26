{% docs _int_finance__docs__int_transactions_converted_to_usd %}
This model joins transactions and chargeback staging tables. It contains information about transactions, including the transaction amounts converted to USD and chargeback status.
{% enddocs %}

{% docs _int_finance__docs__usd_transaction_amount %}
The transaction amount converted to USD based on the exchange rates provided.
{% enddocs %}

{% docs _int_finance__docs__is_transaction_accepted %}
A binary flag indicating whether the transaction was accepted (`1`) or not (`0`).
{% enddocs %}