#!/bin/bash

echo "********************************************"
echo "Developed by Zeynel Akçay and Hasim Yerli"
echo "Çalışma Dizininizde Scripti Çalıştırın. Örn:Desktop"
echo "*************************************"
read -p 'Master Repo Url:' master_repo_url

dir_issues="issues"
if [[ ! -d $dir_issues ]]; then
    mkdir $dir_issues
    echo "$dir_issues dizini oluşturuldu." 
elif [[  -d $dir_issues ]]; then
    echo "$dir_issues dizini zaten mevcut!"
fi

cd $dir_issues
echo "$dir_issues dizininin içine girildi"
read -p 'ISSUE No Giriniz örn(i7):' dir_issue_no
if [[ ! -d $dir_issue_no ]]; then
    mkdir $dir_issue_no
    echo "$dir_issue_no dizini oluşturuldu." 
elif [[  -d $dir_issue_no ]]; then
    echo "$dir_issue_no dizini zaten mevcut"     
fi

cd $dir_issue_no
echo "$dir_issue_no dizininin içine girildi"

git clone $master_repo_url

cd symfony-b2b

echo "symfony-b2b dizininin içine girildi"

git checkout development 

git checkout -b $dir_issue_no 

 echo "Composer Install Çalıştırılsın mı ? (Yes/No)\n"  
   
 read var
 
 if [ "$var" == "Y" ] || [ "$var" == "y" ] || [ "$var" == "yes" ] || [ "$var" == "Yes" ];  
   then  
    composer install 
    echo "\n\n******Composer Install Çalıştırıldı*******"
   else  
    echo "\n\n!!!!!!Composer Install Çalıştırılmadı!!!!!"
 fi


echo 'Bol Kodlu Günler...'
read -p 'Çıkış İçin ENTER: '