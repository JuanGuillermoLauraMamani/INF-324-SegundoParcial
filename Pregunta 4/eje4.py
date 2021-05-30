# -*- coding: utf-8 -*-
"""
Created on Sun May 30 15:37:41 2021

@author: Guille
"""

import cv2
import numpy as np

ruta = "titicaca.jpg"
im = cv2.imread(ruta, cv2.IMREAD_GRAYSCALE)
a = [ [ -1.0, 0.0, 1.0 ],
      [ -1.0, 0.0, 1.0 ],
      [ -1.0, 0.0, 1.0 ] ]
kernel = np.asarray(a)
dst = cv2.filter2D(im, -1, kernel)
print(dst.min(), dst.max())

norm = cv2.normalize(dst, None, 0, 255, cv2.NORM_MINMAX)
print(norm.min(), norm.max())

from IPython.display import Image
Image(filename='titicaca.jpg')

cv2.imwrite("norm.png", norm)
Image(filename="norm.png")