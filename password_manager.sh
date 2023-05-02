#!/bin/bash
password_file="passwords.txt"

echo "パスワードマネージャーへようこそ"
echo "サービス名を入力してください"
read service_name
echo "ユーザー名を入力してください"
read username
echo "パスワードを入力してください"
read password

echo "サービス名:${service_name}, ユーザー名:${username}, パスワード:${password}" >> $password_file

echo "Thank you!"
