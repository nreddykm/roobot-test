*** Settings ***
Library   RPA.Cloud.AWS   region=us-east-1

*** Variables ***
${BUCKET_NAME}        testbucket12213123123

*** Tasks ***
Upload a file into S3 bucket
    [Setup]   Init S3 Client
    Upload File      ${BUCKET_NAME}   ${/}path${/}to${/}file.pdf
    @{files}         List Files   ${BUCKET_NAME}
    FOR   ${file}  IN   @{files}
        Log  ${file}
    END
