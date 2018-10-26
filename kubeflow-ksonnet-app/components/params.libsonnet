{
  global: {
    // User-defined global parameters; accessible to all component and environments, Ex:
    // replicas: 4,
  },
  components: {
    // Component-level parameters, defined initially from 'ks prototype use ...'
    // Each object below should correspond to a component in the components/ directory
    "tf-job-operator": {
      cloud: "null",
      deploymentNamespace: "null",
      deploymentScope: "cluster",
      name: "tf-job-operator",
      tfDefaultImage: "null",
      tfJobImage: "gcr.io/kubeflow-images-public/tf_operator:v0.3.0",
      tfJobUiServiceType: "ClusterIP",
      tfJobVersion: "v1alpha2",
    },
    ambassador: {
      ambassadorImage: "quay.io/datawire/ambassador:0.37.0",
      ambassadorServiceType: "ClusterIP",
      name: "ambassador",
      platform: "none",
    },
    centraldashboard: {
      image: "gcr.io/kubeflow-images-public/centraldashboard:v0.3.0",
      name: "centraldashboard",
    },
    "kubebench-job": {
      controllerImage: "gcr.io/kubeflow-images-public/kubebench/kubebench-controller:v0.3.0",
      csvReporterInput: "result.json",
      csvReporterOutput: "report.csv",
      experimentConfigPvc: "kubebench-config-pvc",
      experimentDataPvc: "null",
      experimentRecordPvc: "kubebench-exp-pvc",
      gcpCredentialsSecret: "null",
      gcpCredentialsSecretKey: "null",
      githubTokenSecret: "null",
      githubTokenSecretKey: "null",
      mainJobConfig: "tf-cnn/tf-cnn-dummy.yaml",
      mainJobKsPackage: "kubebench-examples",
      mainJobKsPrototype: "kubebench-example-tfcnn",
      mainJobKsRegistry: "github.com/kubeflow/kubebench/tree/master/kubebench",
      name: "kubebench-job",
      postJobArgs: "null",
      postJobImage: "gcr.io/kubeflow-images-public/kubebench/kubebench-example-tf-cnn-post-processor:3c75b50",
      reporterType: "csv",
      serviceAccount: "null",
    },
    argo: {
      executorImage: "argoproj/argoexec:v2.2.0",
      name: "argo",
      uiImage: "argoproj/argoui:v2.2.0",
      workflowControllerImage: "argoproj/workflow-controller:v2.2.0",
    },
  },
}
