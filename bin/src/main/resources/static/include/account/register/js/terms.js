$(function() {
	$("#agreeAll").change(function() {
		if ($("#agreeAll").is(":checked")) {
			$("#useTerms, #personalInfoTerms").prop("checked", true);
		} else {
			$("#useTerms, #personalInfoTerms").prop("checked", false);
		}
	});

	$("#useTerms, #personalInfoTerms, #agreeAll").change(function() {
		if ($("#useTerms").is(":checked") && $("#personalInfoTerms").is(":checked")) {
			$("#agreeTermsBtn").attr("disabled", false);
			$("#terms_form").attr({
				"method": "post",
				"action": "/register/phoneCertification"
			});

		} else {
			$("#agreeTermsBtn").attr("disabled", true);
			$("#terms_form").attr("action", "#");
		}
	});
});