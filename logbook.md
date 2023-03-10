
2023-02-01
----------
- meeting: weekly @1200 BT 1.5h
  - present: AM, DM, RS
  - DM: Setup a GitHub repo.
  - DM: Schedule walkthrough session for Tue. DONE
  - AM: Use yosys to synth and make pictures.
  - DM: Ask Anja about scheduling presentations. DONE
  - Andrew will probably meet academic supervisor in around 2 weeks.
- 3 presentations are scheduled.
  - Mon 2023-02-27 at the DDD weekly team meeting.
    - Give an overview of project intentions.
    - Around 10 minutes.
    - Audience of 10..20 people who are all specifically interested.
  - Thu 2023-05-11 at the DDF.
    - Present what the project is, how it has gone so far, and what's left.
    - Around 5 minutes.
    - Audience of 100..200 people with varying levels of interest in details.
    - Shared presentation with other students.
  - Mon 2023-06-05 at the DDD weekly team meeting.
    - Present the main results of the project.
    - Around 30 minutes.
    - Audience of 10..20 people who are all specifically interested.

2023-02-02
----------
- This file is for notes.
  - Meeting minutes.
  - Interesting reading resources.
  - Anything else noteworthy.
- It's a good habit to keep a clear logbook.
- Markdown is nicely rendered on both GitHub and BitBucket.
- This file can be easily searched with the standard text-based tools, unlike
  binary/proprietary formats.
- Academic supervisor Milica Orlandic may join weeklies, time permitting.


2023-02-07
----------
- Meeting: SVI Getting started @ 13:00 NT 39mins
  - present: AM, DM.
  - DM: Make working directory for thesis visible to DDD team - Done.
  - DM: Provided AM with textbooks on Git and Unix.
  - AM: Deep dive into unix commands - To Do, In progress.
  - AM: Deep dive into git commands - To Do, In progress.

2023-02-08
----------
- Self Study
  - Unix(Linux) Commands - textbook and online tutorial.

2023-02-09
----------
- Self Study
  - Unix(Linux) Commands - textbook and online tutorial.
- DDF Meeting

2023-02-10
----------
- Self Study
  - Unix(Linux) Commands - textbook and online tutorial.

2023-02-14
----------
- Self Study
  - Git Commands - textbook and online tutorial.

2023-02-15
----------
- Self Study
  - Git Commands - textbook and online tutorial.
- Created a branch from the master branch for test cases.
- Edited/ created sample test and pushed to remote branch.
- Meeting: weekly @1200 BT 42 mins
  - present: AM, DM, RS
    - Feedback on example test case from DM
     - AM: Setup VScode to be POSIX compliant - use Nik's recommendations &
     VScode link as guide.
     - AM: Avoid commiting commented code - code should be clean.
     - AM: Only use module name top in hierarchical designs.
     - AM: Come up with/ describe naming convention for signals in interfaces
           and signals in modules.
 - DM: Take AM through pull & push request basics later today.
 - DM: Send AM 'boilerplate' for inst, port and svi testcases.
 - DM: AM to use makefile examples from DM as a guide/ starter.
 - RS: AM to seek help from RS when making makefiles for testcases; some errors
       may be subtle and can be fixed quickly by an experienced user.
 - AM: Make 15 initial test cases recommended by DM.
- Meeting: Pull requests and Makefile Intro @ 16:30 NT 60mins
  - Present: AM, DM
  - A walkthrough on pull requests with AM by DM.
  - A quick look at how makefiles work and relevance to project.
  - AM: Use GNU make when making makefiles for using tools in project

2023-02-16
----------
- DDF meeting
- Started work on first 15 initial testcases
  - Made 2 simple test cases using always_ff in the files
    `alwaysff_port.sv` & `alwaysff_svi.sv`.
  - Made 2 simple test cases using always_latch in the files
    `alwayslatch_inst.sv` & `alwayslatch_svi.sv`.
  - Did a quick check of testcases in Vivado;
    - Only 2x test cases with *_port.sv from 8/15 test cases are elaborated
      (Including `test1.sv`).
    - All other test cases are not elaborated.
    - Only `test1.sv` is synthesizable.
    - All other test cases are not synthesizable.
- To Do
  - Investigate cause of no elaboration in some test cases.
  - Investigate cause of no synthesis in testcases other than `test1.sv`.
  - Complete the remaining 7/ 15 test cases.
- Clues as to why some testcases are not able to be elaborated or synthesized:
  - Improper connections/ Instationtion? Some top level ports not connected?
  - Compare other testcases with `test1.sv`.
  - Signals from interface after instantion in top module are not used?
  - Signals not having direction?
  - Module top and/ or interface having no output?

2023-02-21
----------
- Completed the 15 initial testcases.
- Used `force` procedural-continuous assignment with always_comb instead of
  initial begin end statements.
- Check if this is allowed since examples seen use this in initial blocks.
- `alwayslatch_port` and `assign_port` elaborated in Vivado 2020.1.
- `force` not supported in Vivado 2020.1.
- Other testcases failed to elaborate in Vivado.
- To Do
  - Start tutorials/ work on Makefiles.

2023-02-22
----------
- Make reads/ tutorials.
- Weekly Meeting @13:00 NT 25 mins
  - Present: AM, DM, RS, MO
  - AM: Updated team on progress.
  - DM: Accepted 2x pull requests from AM.
  - DM: Updated MO on thesis progress and tasks.
  - RS/DM: Clarified mentioning tool names in logbook.
  - MO: AM to share overleaf of thesis report with MO.
  - DM: AM to focus on setting up intrasftructure (Makefiles) for tests.
  - Meeting time changed to 14:00. Requested by BD; accepted by all.
  - AM: Future pull requests to DM should be to master branch.

2023-02-23
----------
- Make reads/ tutorials.
- Makefile for Yosys linter done.
  - Exits on error - does not check remaining files; to fix.

2023-02-27
----------
- Attempted fixing testcases that generated no netlist.
- DDD presentation on Project.

2023-02-28
----------
- Makefile for icarus:
 - Exits on error - does not check remaining files; to fix.
 - Fixed with || true.
- Makefile for svlint:
 - Checks first file only; to fix.
 - Checks all files but writes stderr into the first .txt file; to fix.
 - Fixed by piping to true.
 - Alternate syntax <svlint -- --lint> may be better for clarity.
- Fixed yosys linter exiting due to 'error' issue.
- Fixed verilator linter exiting due to 'error' issue.
- Running Verilator,Yosys,Svlint and Icarus Linters at once.
- Started looking into Questa and Spyglass userguide for command line syntaxes.

2023-03-01
----------
- Weekly Meeting @14:00 NT 25 mins
  - Present: AM, DM, RS
  - DM: AM to still focus on test infrastructure for now.
  - DM/ RS: Possibility of investigating a real corner case from the design team
    later on.
  - AM: To keep the warnings/error messages from linters as they are - do not
    try to 'fix' the test cases.
- Master thesis report - Chapter 1 (Introduction/Motivation) write up.
- Pull request to DM - Makefiles for 4x tools.

2023-03-02
----------
- Project report structure setup.
- Intro text to Methodology and Experiment chapters.
- Talking points for Theory chapter.
- Review and addition of text/improved structure of chapter 1 of report.
- DDF meeting.


2023-03-07
----------
- Incorporated feedback from DM & BD into draft thesis report.
- Worked on comments from DM from pull request; handling errors in GNU make.
- Command line syntax for Vivado found but opens GUI.
 - Check how to use read_verilog -sv (tcl)command properly for Vivado in shell.

2023-03-08
----------
- Weekly Meeting @14:00 NT 25 mins
  - AM: Brief on progess so far to team.
  - MO: Clarification on direction of thesis.
  - DM,BD,RS: Shed more light on thesis, motivation and expectations.
- Continued work on getting other tools to work - Vivado, Questa, Spyglass.

2023-03-09
----------
- Spyglass and Questa tools initial work.
- Tried batch and gui modes in Spyglass.
- Attemped -shell mode in Spyglass
  - used current_goal lint/lint_rtl
  - used current_goal lint/lint_rtl_enhanced

2023-03-10
----------
- Test cases `force_inst`, `force_port`, `force_svi`
- Tool: Synopsys Spyglass
    - In report, moresimple.rpt (BuiltIn RuleGroup=Design Read)
      - Force statements are not synthesizable
      - Release statements are not synthesizable
