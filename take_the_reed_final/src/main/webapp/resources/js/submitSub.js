function submitSub(month) {
	console.log("실행")
 	var payment = document.getElementById('payment')
 	console.log(payment)
	document.getElementById('addDate').value = month
	
	payment.submit()
}