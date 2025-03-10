package main

import (
	"fmt"
	"os"

	gomail "gopkg.in/gomail.v2"
)

func main() {
	password := os.Getenv("APPKEY2")

	if password == "" {
		fmt.Println("Password is not set")
	} else {
		fmt.Printf("Password: %s\n", password)
	}

	// Create a new email message
	message := gomail.NewMessage()
	message.SetHeader("From", "daakyemedical@gmail.com")
	message.SetHeader(
		"To",
		"wumpinilatif847@gmail.com",
		"DaakyeMedical@gmail.com",
		"Wumpinilatif7779@outlook.com",
		"neamewu@gmail.com",
		"annabelkudiabor70@gmail.com",
		"charlesjesimiel@gmail.com",
	)
	message.SetHeader("Subject", "Welcome to Daakye Medical – Your Policy is Now Active!")

	// Set the improved HTML content
	message.SetBody("text/html", `
		<html>
			<head>
				<style>
					body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
					.container { max-width: 600px; background: #ffffff; padding: 20px; margin: 20px auto; border-radius: 8px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); }
					.header { text-align: center; padding: 10px 0; color: #007bff; }
					.content { font-size: 16px; color: #333333; line-height: 1.6; }
					.footer { text-align: center; margin-top: 20px; font-size: 14px; color: #777777; }
					.button { display: inline-block; padding: 12px 20px; color: white; background-color: #007bff; text-decoration: none; border-radius: 5px; font-weight: bold; margin-top: 20px; }
					.policy-info { background: #f1f1f1; padding: 15px; border-radius: 5px; margin-top: 20px; }
				</style>
			</head>
			<body>
				<div class="container">
					<h2 class="header">🎉 Congratulations! Your Daakye Medical Policy is Now Active</h2>
					<p class="content">
						Dear Valued Customer,<br><br>
						Thank you for choosing <strong>Daakye Medical</strong> for your healthcare coverage. Your insurance policy has been successfully activated.
					</p>
					<div class="policy-info">
						<p><strong>Policy Holder:</strong> [Customer Name]</p>
						<p><strong>Plan Tier:</strong> [Selected Plan]</p>
						<p><strong>Coverage Start Date:</strong> [Start Date]</p>
					</div>
					<p class="content">
						You can now enjoy peace of mind knowing that your health is covered. To explore your benefits, visit your account below:
					</p>
					<p style="text-align: center;">
						<a href="https://daakyemedical.com/my-account" class="button">View My Policy</a>
					</p>
					<p class="content">
						If you have any questions, feel free to reach out to our support team at <a href="mailto:support@daakyemedical.com">support@daakyemedical.com</a>.
					</p>
					<p class="footer">
						&copy; 2025 Daakye Medical. All rights reserved.
					</p>
				</div>
			</body>
		</html>
	`)

	// SMTP settings for Gmail
	dialer := gomail.NewDialer(
		"smtp.gmail.com",
		465,
		"daakyemedical@gmail.com",
		password,
	)

	// Enable SSL
	dialer.SSL = true

	// Send the email
	if err := dialer.DialAndSend(message); err != nil {
		fmt.Println("Failed to send email:", err)
		fmt.Printf("Detailed error: %+v\n", err)
		return
	}

	fmt.Println("Email sent successfully!")
}
