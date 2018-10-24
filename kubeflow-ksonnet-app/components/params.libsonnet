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
  },
}
