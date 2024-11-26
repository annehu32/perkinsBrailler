from machine import Pin
import time

# initializing the pins
extend = Pin('GPIO6', Pin.OUT)
retract = Pin('GPIO7', Pin.OUT)
extend.off()
retract.off()

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

def test():
    for num in range(0,2):
        print("Extending...")
        extendActuator()
        print("retracting...")
        retractActuator()

def runTest():
    extendActuatorTime(.6)
    time.sleep(0.5)
    retractActuatorTime(.7)

for i in range(0,30):
    runTest()
    time.sleep(0.1)



