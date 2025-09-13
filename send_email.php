<?php

if($_SERVER["REQUEST_METHOD"] == 'POST'){
    $name = $_POST['name'];
     $email = $_POST['email'];
      $message = $_POST['message'];

      $to = "poojalamse05@gmail.com";
      $subject = "New contact form submission";
      $header = 'Form' . $name . "<" . $email .
      ">"\r\n;

      $header .= "Reply-To:" . $email . "\r\n"
      $header .= "Contact-Type: text/plain; charset=utf-8\r\n";

      if(mail($to, $subject, $message, $headers)){
        http_response_code(200);
        echo "Email sent successfully!";
      }
      else{
        http_response_code(500);
        echo "Oops! Smething went wrong";
      }
}
else{
        http_response_code(403);
        echo "Access denied";
      }

?>