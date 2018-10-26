local env = std.extVar("__ksonnet/environments");
local params = std.extVar("__ksonnet/params").components["kubebench-job"];

local k = import "k.libsonnet";
local kubebenchJob = import "kubeflow/kubebench/kubebench-job.libsonnet";
local kubebenchRbac = import "kubeflow/kubebench/kubebench-rbac.libsonnet";

local name = params.name;
local namespace = env.namespace;
local serviceAccount = params.serviceAccount;
local controllerImage = params.controllerImage;
local configPvc = params.experimentConfigPvc;
local dataPvc = params.experimentDataPvc;
local experimentPvc = params.experimentRecordPvc;
local gcpCredentialsSecret = params.gcpCredentialsSecret;
local gcpCredentialsSecretKey = params.gcpCredentialsSecretKey;
local githubTokenSecret = params.githubTokenSecret;
local githubTokenSecretKey = params.githubTokenSecretKey;
local mainJobKsPrototype = params.mainJobKsPrototype;
local mainJobKsPackage = params.mainJobKsPackage;
local mainJobKsRegistry = params.mainJobKsRegistry;
local mainJobConfig = params.mainJobConfig;
local postJobArgsStr = params.postJobArgs;
local postJobImage = params.postJobImage;
local reporterType = params.reporterType;
local csvReporterInput = params.csvReporterInput;
local csvReporterOutput = params.csvReporterOutput;

local postJobArgs =
  if postJobArgsStr == "null" then
    []
  else
    std.split(postJobArgs, ",");

local newServiceAccount = if serviceAccount == "null" then "kubebench-user-" + name else serviceAccount;
local rbacParts = if newServiceAccount != serviceAccount then [
  kubebenchRbac.parts.serviceAccount(newServiceAccount, namespace),
  kubebenchRbac.parts.role(newServiceAccount, namespace),
  kubebenchRbac.parts.roleBinding(newServiceAccount, newServiceAccount, newServiceAccount, namespace),
] else [];

local jobParts = [
  kubebenchJob.parts.workflow(name,
                              namespace,
                              newServiceAccount,
                              controllerImage,
                              configPvc,
                              dataPvc,
                              experimentPvc,
                              githubTokenSecret,
                              githubTokenSecretKey,
                              gcpCredentialsSecret,
                              gcpCredentialsSecretKey,
                              mainJobKsPrototype,
                              mainJobKsPackage,
                              mainJobKsRegistry,
                              mainJobConfig,
                              postJobImage,
                              postJobArgs,
                              reporterType,
                              csvReporterInput,
                              csvReporterOutput),
];

std.prune(k.core.v1.list.new(rbacParts + jobParts))
