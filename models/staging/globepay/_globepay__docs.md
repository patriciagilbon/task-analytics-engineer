{% docs _globepay__docs %}
Deel clients can add funds to their Deel account using their credit and debit cards. Deel has partnered with Globepay to process all of these account funding credit and debit card transactionss. Here we can find data coming from Globepay API.
{% enddocs %}

{% docs _globepay__docs__chargebacks %}
This table contains detailed information about chargebacks data in the Deel system. chargebackss are initiated when a customer disputes a payment, and the bank or payment processor reverses the transactions.
{% enddocs %}

{% docs _globepay__docs__stg_globepay__chargebacks %}
This table is the staging layer for chargebacks data from Globepay. In this table, data is imported with minimal transformations, primarily focused on renaming fields to match the required schema for downstream processing.
{% enddocs %}

{% docs _globepay__docs__transaction_id %}
Unique identifier for each chargebacks transactions.
{% enddocs %}

{% docs _globepay__docs__chargeback_status %}
The current status of the chargebacks. Only possible value is TRUE.
{% enddocs %}

{% docs _globepay__docs__chargeback_source %}
The source or origin of the chargebacks. Only possible value is GLOBALPAY.
{% enddocs %}

{% docs _globepay__docs__is_chargeback %}
A boolean flag indicating whether the transactions is a chargebacks or not. Possible values are 1 or 0.
{% enddocs %}

---

{% docs _globepay__docs__transactions %}
This model represents transactions-related data in the Deel system. transactions data captures information about the approval or rejection of transactionss, such as payments made or refunds processed.
{% enddocs %}

{% docs _globepay__docs__stg_globepay__transactions %}
This table is the staging layer for transactions data from Globepay. In this table, data is imported with minimal transformations, primarily focused on renaming fields to match the required schema for downstream processing.
{% enddocs %}

{% docs _globepay__docs__transaction_status %}
The status of the transactions. Only possible value is TRUE.
{% enddocs %}

{% docs _globepay__docs__transaction_source %}
The source or origin of the transactions. Only possible value is GLOBALPAY.
{% enddocs %}

{% docs _globepay__docs__transaction_ref %}
A reference number for the transactions transactions, typically used to cross-reference other systems.
{% enddocs %}

{% docs _globepay__docs__transaction_at %}
The date and time when the transactions transactions was created.
{% enddocs %}

{% docs _globepay__docs__transaction_state %}
The current state of the transactions, which can be DECLINED or ACCEPTED.
{% enddocs %}

{% docs _globepay__docs__transaction_amount %}
The monetary amount involved in the transaction in the original currency it was made.
{% enddocs %}

{% docs _globepay__docs__transaction_country %}
The country where the transactions transactions occurred. Possible values are:
- US
- MX
- UK
- FR
- CA
- AE
{% enddocs %}

{% docs _globepay__docs__transaction_currency %}
The currency in which the transactions transactions was processed. Possible values are:
- USD
- MXN
- GBP
- EUR
- CAD
{% enddocs %}

{% docs _globepay__docs__transaction_rates %}
Array that contains the exchange rates applied during the transactions if the transactions involves currency conversion.
{% enddocs %}

{% docs _globepay__docs__is_cvv_provided %}
A boolean flag indicating whether the CVV (Card Verification Value) was provided during the transactions process.
{% enddocs %}