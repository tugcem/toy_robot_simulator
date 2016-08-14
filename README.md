# toy_robot_simulator
Simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

Example Input and Output
------------------------

### Example a

    PLACE 0,0,NORTH
    MOVE
    REPORT

Expected output:

    0,1,NORTH

### Example b

    PLACE 0,0,NORTH
    LEFT
    REPORT

Expected output:

    0,0,WEST

### Example c

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

Expected output

    3,3,NORTH

To Run Simulator
-----------------
- bundle install
- ruby toy_robot_simulator.rb


To Run Tests
------------
- rspec spec/
