# Lesson: See a Periodic Scheduler Miss a Deadline

## Guiding question

When does logically correct software become physically late?

## Mental model

A real-time system is correct only when the right computation finishes before the physical deadline. Priority, execution time, and release timing compete on one processor.

## What to manipulate

Use `interactive.m`. Change one lever at a time before combining effects.

## First observation

Raise execution time until utilization approaches one. Watch low-priority work fragment, then miss deadlines even though every individual algorithm is logically correct.

## Common mistakes

- Average CPU utilization does not prove worst-case schedulability.
- Higher priority protects one task by delaying another.
- A deadline miss can be a system failure even when all computed values are numerically correct.

## Completion standard

The learner can explain the baseline, identify what each lever changes, diagnose the deliberately broken case, and pass `run_checks.m`.
