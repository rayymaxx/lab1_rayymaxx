# Full Self Driving Simulation: ALU Rwanda to Kigali Convention Centre

An individual coding lab for *Introduction to Python Programming and Databases* (African Leadership University, BSE Year 1, Trimester 2).

A simulated FSD Tesla drives from ALU Rwanda to the Convention Center. The road is a Python list, and each item is a 100 m segment holding a sign:

| Item | Meaning |
|------|---------|
| `"60"`, `"80"` (any number 20 to 100) | Speed limit sign |
| `"zebra"` | Zebra crossing: the car stops, then continues |
| `"bus"` | Bus in the right lane: the car moves to the left lane |
| `"road"` | Plain road: nothing happens |

## Files

| File | Purpose |
|------|---------|
| `road_simulation.py` | **My work.** The 10 completed TODO functions and the road list |
| `analyze_log.sh` | **My work.** Bash log analyser (optional add-on) |
| `engine.py` | Provided web server and state. Not edited |
| `transit_program.py` | Provided simulation loop. Not edited |
| `index.html` | Provided web page. Not edited |
| `transit_session.log` | Created automatically on each run |

## Functions implemented

- **Check the sign:** `is_valid_sign`, `get_sign_type`
- **Take action:** `get_speed_limit`, `get_target_speed`, `adjust_speed`, `count_signs`
- **Input and summary:** `ask_for_number`, `insert_sign`, `replace_sign`, `get_journey_summary`

## How to run

1. Open a terminal in the project folder (`lab1_githubUsername`).
2. Run `python road_simulation.py` (or `python3 road_simulation.py`).
3. Enter your driver name, then use the road editor menu.
4. Choose **5. Start driving** and open the link shown (e.g. `http://127.0.0.1:8008`).
5. Go back to the terminal and press Enter. The car starts to drive.

## Log analyser

After at least one run, execute:

```bash
bash analyze_log.sh                 # uses transit_session.log
bash analyze_log.sh other_file.log  # uses a different log
```

It prints:
- number of sessions (runs) in the log
- total zebra crossing stops and lane changes
- driver name and top speed of the latest trip

If the file does not exist, it prints an error and exits with code 1. If the latest run was not finished, it says there is no trip report yet.

## Notes

- Signs are stored as text, even speed limits.
- Only `bus`, `zebra`, or a number from 20 to 100 can be added to the road.
- `ask_for_number` and the insert/replace functions validate input so the program does not crash.