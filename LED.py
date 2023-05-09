#LEDproject.py
import time
import RPi.GPIO as GPIO

green = 4
red = 17
blue = 27
yellow = 22
delay = 1

GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.OUT)
GPIO.setup(17, GPIO.OUT)
GPIO.setup(27, GPIO.OUT)
GPIO.setup(22, GPIO.OUT)
time.sleep(1)
# 0
GPIO.output(green, False)
GPIO.output(red, False)
GPIO.output(blue, False)
GPIO.output(yellow, False)
# 1
GPIO.output(green, True)
time.sleep(delay)
# 2
GPIO.output(green, False)
GPIO.output(red, True)
time.sleep(delay)
# 3
GPIO.output(green, True)
time.sleep(delay)
# 4
GPIO.output(green, False)
GPIO.output(red, False)
GPIO.output(blue, True)
time.sleep(delay)
# 5
GPIO.output(green, True)
time.sleep(delay)
# 6
GPIO.output(green, False)
GPIO.output(red, True)
time.sleep(delay)
# 7
GPIO.output(green, True)
time.sleep(delay)
# 8
GPIO.output(green, False)
GPIO.output(red, False)
GPIO.output(blue, False)
GPIO.output(yellow, True)
time.sleep(delay)
# 9
GPIO.output(green, True)
time.sleep(delay)
# 10
GPIO.output(green, False)
GPIO.output(red, True)
time.sleep(delay)
# 11
GPIO.output(green, True)
time.sleep(delay)
# 12
GPIO.output(green, False)
GPIO.output(red, False)
GPIO.output(blue, True)
time.sleep(delay)
# 13
GPIO.output(green, True)
time.sleep(delay)
# 14
GPIO.output(red, True)
GPIO.output(green, False)
time.sleep(delay)
# 15
GPIO.output(green, True)
time.sleep(delay)
# Resest
GPIO.output(green, False)
GPIO.output(red, False)
GPIO.output(blue, False)
GPIO.output(yellow, False)





