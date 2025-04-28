<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
</head>
<body>

    <h1>Payment Page</h1>
    <button id="pay-button">Pay with Midtrans</button>

    <script type="text/javascript" src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="{{ env('MIDTRANS_CLIENT_KEY') }}"></script>
    <script type="text/javascript">
        document.getElementById('pay-button').onclick = function () {
            snap.pay("{{ $snapToken }}", {
                onSuccess: function(result){
                    window.location.href = "/payment-success";
                },
                onPending: function(result){
                    alert("waiting for your payment");
                },
                onError: function(result){
                    alert("payment failed");
                    window.location.href = "/payment-failed";
                }
            });
        };
    </script>
</body>
</html>
