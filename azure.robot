*** Settings ***
Library  RPA.Cloud.Azure

*** Variables ***
${IMAGE_URL}   IMAGE_URL
${FEATURES}    Faces,ImageType

*** Tasks ***
Visioning image information
   Init Computer Vision Service
   &{result}   Vision Analyze  image_url=${IMAGE_URL}  visual_features=${FEATURES}
   @{faces}    Set Variable  ${result}[faces]
   FOR  ${face}  IN   @{faces}
      Log  Age: ${face}[age], Gender: ${face}[gender], Rectangle: ${face}[faceRectangle]
   END

