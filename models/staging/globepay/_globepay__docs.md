{% docs _globepay__docs %}
Deel clients can add funds to their Deel account using their credit and debit cards. Deel has partnered with Globepay to process all of these account funding credit and debit card transactions. Here we can find data coming from Globepay API.
{% enddocs %}

{% docs _globepay__docs__chargeback %}
This table contains detailed information about chargeback data in the Deel system. Chargebacks are initiated when a customer disputes a payment, and the bank or payment processor reverses the transaction.
{% enddocs %}

{% docs _globepay__docs__stg_globepay__chargeback %}
This table is the staging layer for chargeback data from Globepay. In this table, data is imported with minimal transformations, primarily focused on renaming fields to match the required schema for downstream processing.
{% enddocs %}

{% docs _globepay__docs__ref_id %}
Unique identifier for each chargeback transaction.
{% enddocs %}

{% docs _globepay__docs__chargeback_status %}
The current status of the chargeback. Only possible value is TRUE.
{% enddocs %}

{% docs _globepay__docs__chargeback_source %}
The source or origin of the chargeback. Only possible value is GLOBALPAY.
{% enddocs %}

{% docs _globepay__docs__is_chargeback %}
A boolean flag indicating whether the transaction is a chargeback or not. Possible values are 1 or 0.
{% enddocs %}

---

{% docs _globepay__docs__acceptance %}
This model represents acceptance-related data in the Deel system. Acceptance data captures information about the approval or rejection of transactions, such as payments made or refunds processed.
{% enddocs %}

{% docs _globepay__docs__stg_globepay__acceptance %}
This table is the staging layer for acceptance data from Globepay. In this table, data is imported with minimal transformations, primarily focused on renaming fields to match the required schema for downstream processing.
{% enddocs %}

{% docs _globepay__docs__acceptance_status %}
The status of the acceptance. Only possible value is TRUE.
{% enddocs %}

{% docs _globepay__docs__acceptance_source %}
The source or origin of the acceptance. Only possible value is GLOBALPAY.
{% enddocs %}

{% docs _globepay__docs__acceptance_ref %}
A reference number for the acceptance transaction, typically used to cross-reference other systems.
{% enddocs %}

{% docs _globepay__docs__acceptance_at %}
The date and time when the acceptance transaction was created.
{% enddocs %}

{% docs _globepay__docs__acceptance_state %}
The current state of the acceptance, which can be DECLINED or ACCEPTED.
{% enddocs %}

{% docs _globepay__docs__acceptance_amount %}
The monetary amount involved in the acceptance transaction. This is the value of the payment or refund that was accepted.
{% enddocs %}

{% docs _globepay__docs__acceptance_country %}
The country where the acceptance transaction occurred. Possible values are:
- US
- MX
- UK
- FR
- CA
- AE
{% enddocs %}

{% docs _globepay__docs__acceptance_currency %}
The currency in which the acceptance transaction was processed. Possible values are:
- USD
- MXN
- GBP
- EUR
- CAD
{% enddocs %}

{% docs _globepay__docs__acceptance_rates %}
The exchange rate applied during the transaction if the transaction involves currency conversion.
{% enddocs %}

{% docs _globepay__docs__is_cvv_provided %}
A boolean flag indicating whether the CVV (Card Verification Value) was provided during the transaction process.
{% enddocs %}