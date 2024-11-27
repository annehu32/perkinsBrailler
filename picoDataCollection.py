# picoDataCollection.py
# Last edited by: Anne Hu, 11/27/24
# Purpose: To run the linear actuator to depress the brailler with load cell attached for lubricant test data collection.

from machine import Pin
import time

# ----- Initializing the pins ------
extend = Pin('GPIO6', Pin.OUT) # Pico Pin 6, L298H IN1
retract = Pin('GPIO7', Pin.OUT) # Pico Pin 7, L298H IN2
extend.off()
retract.off()

# ----- Linear actuator control by specified time ------
def extendActuatorTime(sec):
    global extend
    
    extend.on()
    time.sleep(sec)
    extend.off()
    time.sleep(0.1)

def retractActuatorTime(sec):
    global retract
    
    retract.on()
    time.sleep(sec)
    retract.off()
    time.sleep(0.1)
    
# ----- Linear actuator control by set time ------
def extendActuator():
    global extend
    
    extend.on()
    time.sleep(0.5)
    extend.off()
    time.sleep(0.1)

def retractActuator():
    global retract
    
    retract.on()
    time.sleep(sec)
    retract.off()
    time.sleep(0.1)
    
# ----- Test Code ------
def runTest():
    extendActuatorTime(.6) # TODO: This timing will need to be adjusted based on the height of the load cell rig
    time.sleep(0.5)
    retractActuatorTime(.7)

# Runs the linear actuator to depress the key 30 times
for i in range(0, 30):
    runTest()
    time.sleep(0.1)



