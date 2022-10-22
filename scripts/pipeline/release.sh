bucket_name=$1
aws_key=$2
aws_access_key=$3
aws_access_secret=$4
local_path=$5
ssh_ip_address=$6

# Remove any existing versions of a ZIP file
rm -rf $local_path

# Create a zip of the current directory.
zip -r $local_path . -x .git/ .git/*** .github/workflows/release.yml scripts/pipeline/release.sh scripts/pipeline/upload_file_to_s3.py

# Install required dependencies for Python script.
pip3 install boto3

# Run upload script
python3 scripts/pipeline/upload_file_to_s3.py $bucket_name $aws_key $aws_access_key $aws_access_secret $local_path

# Trigger deploy
# echo "$ssh_key" | tr -d '\r' > key.pem
chmod 400 key.pem
echo "----------------"
cat key.pem
echo "----------------"
echo "ssh_ip_address: $ssh_ip_address"
echo ""
ssh -i key.pem -o StrictHostKeychecking=no ec2-user@$ssh_ip_address "/home/ec2-user/deploy.sh"

