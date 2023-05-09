#!/bin/bash
password_file="passwords.txt"

add_password() {
  echo "サービス名を入力してください"
  read service_name
  echo "ユーザー名を入力してください"
  read username
  echo "パスワードを入力してください"
  read password

  echo "サービス名:${service_name}, ユーザー名:${username}, パスワード:${password}" >> $password_file

  echo "パスワードの追加は成功しました"
}

get_password() {
  echo "サービス名を入力してください"
  read service_name
  result=$(grep -F "サービス名:${service_name}," $password_file)

  if [ "$result" ]; then
    service=$(echo $result | cut -d ',' -f 1)
    user=$(echo $result | cut -d ',' -f 2)
    pass=$(echo $result | cut -d ',' -f 3)
    echo " $service\n$user\n$pass"
  else
    echo "そのサービス名は登録されていません。"
  fi
}

echo "パスワードマネージャーへようこそ"

while true; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
  read choice

  case $choice in
    "Add Password" )
      add_password
      ;;
    "Get Password" )
      get_password
      ;;
    "Exit" )
      echo "Thank you!"
      break
      ;;
    * )
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
  esac
done
