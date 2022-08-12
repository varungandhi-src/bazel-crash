# Bazel crash minimal repo

Crash trace with Bazel 5.0.0 and 5.2.0-brew

```
❯ bazel test //...
INFO: Analyzed target //:a (0 packages loaded, 0 targets configured).
INFO: Found 1 test target...
[3 / 4] Testing //:a; 1s darwin-sandbox
FATAL: bazel crashed due to an internal error. Printing stack trace:
java.lang.RuntimeException: Unrecoverable error while evaluating node 'UnshareableActionLookupData{actionLookupKey=ConfiguredTargetKey{label=//:a, config=BuildConfigurationValue.Key[53c17f0388583eb7c10294ae5345d717d6055fc9e92aed4ef6c9e5296c1e8c5c]}, actionIndex=4}' (requested by nodes 'TestCompletionKey{configuredTargetKey=ConfiguredTargetKey{label=//:a, config=BuildConfigurationValue.Key[53c17f0388583eb7c10294ae5345d717d6055fc9e92aed4ef6c9e5296c1e8c5c]}, topLevelArtifactContext=com.google.devtools.build.lib.analysis.TopLevelArtifactContext@90904c3b, exclusiveTesting=false}')
        at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:674)
        at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:382)
        at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
        at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
        at java.base/java.lang.Thread.run(Thread.java:829)
Caused by: java.lang.IllegalArgumentException: Multiple entries with same key: TEST_NAME=//:a and TEST_NAME=a
        at com.google.common.collect.ImmutableMap.conflictException(ImmutableMap.java:210)
        at com.google.common.collect.ImmutableMap.checkNoConflict(ImmutableMap.java:204)
        at com.google.common.collect.RegularImmutableMap.checkNoConflictInKeyBucket(RegularImmutableMap.java:146)
        at com.google.common.collect.RegularImmutableMap.fromEntryArray(RegularImmutableMap.java:109)
        at com.google.common.collect.ImmutableMap$Builder.build(ImmutableMap.java:389)
        at com.google.devtools.build.lib.exec.StandaloneTestStrategy.createXmlGeneratingSpawn(StandaloneTestStrategy.java:552)
        at com.google.devtools.build.lib.exec.StandaloneTestStrategy.access$1700(StandaloneTestStrategy.java:84)
        at com.google.devtools.build.lib.exec.StandaloneTestStrategy$BazelTestAttemptContinuation.execute(StandaloneTestStrategy.java:921)
        at com.google.devtools.build.lib.analysis.test.TestRunnerAction$RunAttemptsContinuation.execute(TestRunnerAction.java:1177)
        at com.google.devtools.build.lib.analysis.test.TestRunnerAction.execute(TestRunnerAction.java:948)
        at com.google.devtools.build.lib.analysis.test.TestRunnerAction.execute(TestRunnerAction.java:937)
        at com.google.devtools.build.lib.skyframe.SkyframeActionExecutor$5.execute(SkyframeActionExecutor.java:907)
        at com.google.devtools.build.lib.skyframe.SkyframeActionExecutor$ActionRunner.continueAction(SkyframeActionExecutor.java:1076)
        at com.google.devtools.build.lib.skyframe.SkyframeActionExecutor$ActionRunner.run(SkyframeActionExecutor.java:1031)
        at com.google.devtools.build.lib.skyframe.ActionExecutionState.runStateMachine(ActionExecutionState.java:152)
        at com.google.devtools.build.lib.skyframe.ActionExecutionState.getResultOrDependOnFuture(ActionExecutionState.java:91)
        at com.google.devtools.build.lib.skyframe.SkyframeActionExecutor.executeAction(SkyframeActionExecutor.java:492)
        at com.google.devtools.build.lib.skyframe.ActionExecutionFunction.checkCacheAndExecuteIfNeeded(ActionExecutionFunction.java:856)
        at com.google.devtools.build.lib.skyframe.ActionExecutionFunction.computeInternal(ActionExecutionFunction.java:349)
        at com.google.devtools.build.lib.skyframe.ActionExecutionFunction.compute(ActionExecutionFunction.java:169)
        at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:590)
        ... 4 more
```
