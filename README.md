# intelligent-systems-project-2

ASP – Graph Coloring

### Alex's AI-Usage

12/1/25 – used Gemini 3 Pro (Thinking) earlier for another part of the project.


# Part 2: clingo graph-coloring

instance.lp — graph definition (nodes + edges)
coloring.lp — coloring rules, constraints, and optimization

Problem Description: The goal is to solve a graph-coloring problem using ASP.
Each node in a graph must be assigned one color, and connected nodes cannot share the same color.
The program also tries to minimize the number of colors used, which is a common optimization in scheduling and map-coloring problems.

Solution Approach:
- The graph structure is written in instance.lp.

- coloring.lp assigns one color per node using a choice rule.

- A constraint blocks adjacent nodes from sharing the same color.

- A #minimize statement reduces the number of colors used in the final solution.

Sample Results:
Command (instlal clingo.exe before running):
clingo instance.lp coloring.lp

Reading from instance.lp ...
Solving...
Answer: 1
assign(b,green) assign(a,blue) assign(c,yellow) assign(d,red) assign(e,green) used(red) used(green) used(blue) used(yellow)
Optimization: 4
Answer: 2
assign(b,green) assign(a,blue) assign(c,yellow) assign(d,green) assign(e,blue) used(green) used(blue) used(yellow)
Optimization: 3
OPTIMUM FOUND

Models       : 2     
  Optimum    : yes
Optimization : 3
Calls        : 1
Time         : 0.011s (Solving: 0.01s 1st Model: 0.00s Unsat: 0.00s)
CPU Time     : 0.016s

Output explanation: The program solves at first with one option and tries to optimize it to use fewer colors, that is why we see the second answer set. 

# Exequiel AI usage

Asked chatgpt 5.1 to generate the instance.lp as an good example.

Asked it to fix an issue with the coloring when optimizing, fixed lines 10 and 13