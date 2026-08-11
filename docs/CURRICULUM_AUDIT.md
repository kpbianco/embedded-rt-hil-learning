# Curriculum readiness audit

**Track:** Embedded, Real-Time, and Hardware-in-the-Loop Systems

## Baseline conclusion

The repository has 24 uniquely identified modules in a six-phase, prerequisite-ordered sequence. P01 is the complete reference slice; P02-P24 are explicit non-runnable batch scaffolds. The learner flow is read → visualize → move one lever → visualize the delta → read/explain, followed by a broken case, checks, and teach-back.

Static structure and CLI behavior are verified in CI. MATLAB was not available during the 2026-08-11 baseline audit, so numerical execution, UI behavior, and instructional efficacy remain named validation gaps rather than implied evidence.

## Coverage and compounding order

### Phase 1: Microcontroller execution

- **P01 — See a Periodic Scheduler Miss a Deadline:** When does logically correct software become physically late?
- **P02 — Drive GPIO with a State Machine:** What inputs, observable effects, and failure modes matter when you drive GPIO with a State Machine?
- **P03 — Compare Polling and Interrupts:** What inputs, observable effects, and failure modes matter when you compare Polling and Interrupts?
- **P04 — Measure Timer Quantization:** What inputs, observable effects, and failure modes matter when you measure Timer Quantization?

### Phase 2: Buses and acquisition

- **P05 — Frame Bytes over UART:** What inputs, observable effects, and failure modes matter when you frame Bytes over UART?
- **P06 — Compare SPI and I2C Transactions:** What inputs, observable effects, and failure modes matter when you compare SPI and I2C Transactions?
- **P07 — Sample an ADC Without Aliasing:** What inputs, observable effects, and failure modes matter when you sample an ADC Without Aliasing?
- **P08 — Command a DAC and Observe Settling:** What inputs, observable effects, and failure modes matter when you command a DAC and Observe Settling?

### Phase 3: RTOS behavior

- **P09 — Schedule Tasks by Priority:** What inputs, observable effects, and failure modes matter when you schedule Tasks by Priority?
- **P10 — Trigger Priority Inversion:** What inputs, observable effects, and failure modes matter when you trigger Priority Inversion?
- **P11 — Protect Shared Data Without Excess Blocking:** What inputs, observable effects, and failure modes matter when you protect Shared Data Without Excess Blocking?
- **P12 — Measure Jitter and Worst-Case Response Time:** What inputs, observable effects, and failure modes matter when you measure Jitter and Worst-Case Response Time?

### Phase 4: Data movement and timing

- **P13 — Move Samples with DMA:** What inputs, observable effects, and failure modes matter when you move Samples with DMA?
- **P14 — Prevent Ring-Buffer Overrun:** What inputs, observable effects, and failure modes matter when you prevent Ring-Buffer Overrun?
- **P15 — Align Clocks with PPS and Timestamps:** What inputs, observable effects, and failure modes matter when you align Clocks with PPS and Timestamps?
- **P16 — Execute a Multi-Rate Processing Graph:** What inputs, observable effects, and failure modes matter when you execute a Multi-Rate Processing Graph?

### Phase 5: Health and fault handling

- **P17 — Recover with a Watchdog:** What inputs, observable effects, and failure modes matter when you recover with a Watchdog?
- **P18 — Detect a Stuck Sensor:** What inputs, observable effects, and failure modes matter when you detect a Stuck Sensor?
- **P19 — Inject Communication Faults:** What inputs, observable effects, and failure modes matter when you inject Communication Faults?
- **P20 — Enter and Exit a Safe State:** What inputs, observable effects, and failure modes matter when you enter and Exit a Safe State?

### Phase 6: SIL, PIL, and HIL

- **P21 — Compare Software, Processor, and Hardware Loops:** What inputs, observable effects, and failure modes matter when you compare Software, Processor, and Hardware Loops?
- **P22 — Replay an Input Deterministically:** What inputs, observable effects, and failure modes matter when you replay an Input Deterministically?
- **P23 — Define a Device Command and Telemetry Contract:** What inputs, observable effects, and failure modes matter when you define a Device Command and Telemetry Contract?
- **P24 — Produce Repeatable Verification Evidence:** What inputs, observable effects, and failure modes matter when you produce Repeatable Verification Evidence?

## Batch readiness gates

A scaffold may become `implemented` only when it has a deterministic model, a sectioned experiment, two independent parameter sweeps, one deliberately broken case, interactive controls, interpretation-focused tutor text, numerical checks, focused static tests, and evidence that says exactly what did and did not run.
