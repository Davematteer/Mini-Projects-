package main

import (
	"fmt"
	"os"

	gomail "gopkg.in/gomail.v2"
)

func main() {
	// Create a new email message
	message := gomail.NewMessage()
	message.SetHeader("From", "daakyemedical@gmail.com")
	message.SetHeader("To", "davematteer@gmail.com")
	message.SetHeader("Subject", "Hello from Daakye Medical!")

	// Set the HTML content
	message.SetBody("text/html", `
		<html>
			<body>
				<h2 style="color:blue;">Welcome to Our Service!</h2>
				<p>This is a test email sent via Gmail SMTP.</p>
				<p><strong>Hope you enjoy the service!</strong></p>
			</body>
		</html>
	`)

	// SMTP settings for Gmail
	dialer := gomail.NewDialer(
		"smtp.gmail.com",
		587,
		"daakyemedical@gmail.com",
		os.Getenv("APPKEY"),
	)

	// Enable STARTTLS
	dialer.SSL = false
	fmt.Println(os.Getenv("APPKEY"))
	// Send the email
	if err := dialer.DialAndSend(message); err != nil {
		fmt.Println("Failed to send email:", err)
		fmt.Printf("Detailed error: %+v\n", err)
		return
	}

	fmt.Println("Email sent successfully!")
}
