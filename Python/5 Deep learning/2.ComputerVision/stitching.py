import cv2
import glob
import os
import numpy as np
import imutils

def stitch_images(image_files):
    # Read images
    images = []
    for image_file in image_files:
        img = cv2.imread(image_file)
        if img is not None:
            images.append(img)
        else:
            print(f"Warning: Could not read image {image_file}")

    # Create a stitcher object
    stitcher = cv2.Stitcher_create(cv2.Stitcher_PANORAMA)

    # Stitch images
    status, stitched_image = stitcher.stitch(images)

    if status == cv2.Stitcher_OK:
        print("Image stitching successful.")
        return stitched_image
    else:
        print(f"Image stitching failed with status code {status}")
        if status == 1:
            print("Error: Need more images or better overlapping.")
        elif status == 2:
            print("Error: Homography estimation failed.")
        elif status == 3:
            print("Error: Camera parameters adjustment failed.")
        return None

def crop_to_rectangle(image):
    image = cv2.copyMakeBorder(image, 10,10,10,10, cv2.BORDER_CONSTANT, (0,0,0))
    # Convert to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # Threshold the image to get a binary image
    thresh_img = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY)[1]
    # Find contours in the binary image
    contours = cv2.findContours(thresh_img.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    

    contours = imutils.grab_contours(contours)
    areaOI = max(contours, key=cv2.contourArea)

    mask = np.zeros(thresh_img.shape, dtype="uint8")
    x,y,w,h = cv2.boundingRect(areaOI)
    cv2.rectangle(mask, (x,y), (x+w, y+h), 255, -1)

    minRectangle = mask.copy()
    sub = mask.copy()

    while cv2.countNonZero(sub) > 0:
        minRectangle = cv2.erode(minRectangle,None)
        sub = cv2.subtract(minRectangle, thresh_img)

    contours = cv2.findContours(minRectangle.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    
    contours = imutils.grab_contours(contours)
    areaOI = max(contours, key=cv2.contourArea)
    x,y,w,h = cv2.boundingRect(areaOI)

    stitch_img = image[y:y+h, x:x+w]



    return stitch_img  # Return the original image if no contour is found

def save_image(image, path):
    cv2.imwrite(path, image)
    print(f"Image saved at {path}")

def main():
    image_files = glob.glob("images/*")
    if not image_files:
        print("No images found in the specified directory.")
        return
    
    stitched_image = stitch_images(image_files)

    
    if stitched_image is not None:
        output_path_stitch = os.path.join("images", "stitched_output.jpg")
        save_image(stitched_image, output_path_stitch)
        
        cropped_image = crop_to_rectangle(stitched_image)
        output_path = os.path.join("images", "stitched_output_cropped.jpg")
        save_image(cropped_image, output_path)

if __name__ == "__main__":
    main()