# Workshop RedHat@Semperti

Este repositorio fue armado para el workshop previsto para el 04/06/2020 sobre lo nuevo en Openshift 4.4 (KNative, Tekton y Quarkus).

## Comenzando 🚀

A continuacion les dejo algunos comentarios de la demo

## Ambientes
Openshift que usamos https://console-openshift-console.apps.cluster-666-3005.666-3005.example.opentlc.com/dashboards


## Quarkus

1) El proyecto que se utiliza __quarkus-started__ se genero por linea de consola de la siguiente manera:

```
$ mvn io.quarkus:quarkus-maven-plugin:1.4.2.Final:create \
    -DprojectGroupId=org.acme \
    -DprojectArtifactId=quarkus-started \
    -DclassName="org.acme.getting.started.HelloResource" \
    -Dpath="/hello"
[INFO] Scanning for projects...
[INFO] ========================================================================================
[INFO] Your new application has been created in /home/jsfrnc/Repos/workshop-ocp/quarkus-started
[INFO] Navigate into this directory and launch your application with mvn quarkus:dev
[INFO] Your application will be accessible on http://localhost:8080
[INFO] ========================================================================================
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  3.309 s
[INFO] Finished at: 2020-06-01T14:55:24-03:00
[INFO] ------------------------------------------------------------------------
```

Tambien podemos crearlo por medio de https://code.quarkus.io/

2) Para levantar en modo de Dev Quarkus hacemos lo siguiente

```
$ mvn compile quarkus:dev
[INFO] Scanning for projects...
[INFO]
[INFO] ----------------------< org.acme:quarkus-started >----------------------
[INFO] Building quarkus-started 1.0-SNAPSHOT
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ quarkus-started ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 2 resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ quarkus-started ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /home/jsfrnc/Repos/workshop-ocp/quarkus-started/target/classes
[INFO]
[INFO] --- quarkus-maven-plugin:1.4.2.Final:dev (default-cli) @ quarkus-started ---
Listening for transport dt_socket at address: 5005
__  ____  __  _____   ___  __ ____  ______
 --/ __ \/ / / / _ | / _ \/ //_/ / / / __/
 -/ /_/ / /_/ / __ |/ , _/ ,< / /_/ /\ \
--\___\_\____/_/ |_/_/|_/_/|_|\____/___/
2020-06-01 14:58:36,949 WARN  [io.qua.dep.QuarkusAugmentor] (main) Using Java versions older than 11 to build Quarkus applications is deprecated and will be disallowed in a future release!
2020-06-01 14:58:38,060 INFO  [io.quarkus] (Quarkus Main Thread) quarkus-started 1.0-SNAPSHOT (powered by Quarkus 1.4.2.Final) started in 1.192s. Listening on: http://0.0.0.0:8080
2020-06-01 14:58:38,065 INFO  [io.quarkus] (Quarkus Main Thread) Profile dev activated. Live Coding activated.
2020-06-01 14:58:38,067 INFO  [io.quarkus] (Quarkus Main Thread) Installed features: [cdi, resteasy]
```

IMPORTANTE: Usamos el htop para ver los threads y el consumo de memoria en el equipo.


Generamos un jar
```
$ mvn clean package -DskipTests
[INFO] Scanning for projects...
[INFO]
[INFO] ----------------------< org.acme:quarkus-started >----------------------
[INFO] Building quarkus-started 1.0-SNAPSHOT
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  6.258 s
[INFO] Finished at: 2020-06-01T15:04:25-03:00
[INFO] ------------------------------------------------------------------------
```


Creamos en modo native
```
$ mvn clean package -DskipTests -Pnative
[INFO] Scanning for projects...
[INFO]
[INFO] ----------------------< org.acme:quarkus-started >----------------------
[INFO] Building quarkus-started 1.0-SNAPSHOT
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[quarkus-started-1.0-SNAPSHOT-runner:9438]    classlist:   7,170.49 ms,  1.15 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]        (cap):   2,171.98 ms,  1.15 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]        setup:   4,965.47 ms,  1.15 GB
15:06:52,513 INFO  [org.jbo.threads] JBoss Threads version 3.1.1.Final
[quarkus-started-1.0-SNAPSHOT-runner:9438]     (clinit):     632.95 ms,  2.32 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]   (typeflow):  13,401.42 ms,  2.32 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]    (objects):   9,345.76 ms,  2.32 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]   (features):     514.30 ms,  2.32 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]     analysis:  24,953.32 ms,  2.32 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]     universe:     956.81 ms,  2.32 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]      (parse):   2,541.30 ms,  2.32 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]     (inline):   5,086.29 ms,  3.24 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]    (compile):  25,073.87 ms,  4.70 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]      compile:  34,460.39 ms,  4.70 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]        image:   2,112.32 ms,  4.70 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]        write:     736.59 ms,  4.70 GB
[quarkus-started-1.0-SNAPSHOT-runner:9438]      [total]:  75,808.39 ms,  4.70 GB
[INFO] [io.quarkus.deployment.QuarkusAugmentor] Quarkus augmentation completed in 80726ms
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:25 min
[INFO] Finished at: 2020-06-01T15:07:47-03:00
[INFO] ------------------------------------------------------------------------
```

## Deployar Quarkus en Openshift


El archivo Dockerfile.jvm se puede usar para crear una imagen de contenedor de la aplicación Quarkus Java.
El archivo Dockerfile.native se puede usar para crear una imagen de contenedor nativa de la aplicación Quarkus.

```
$ docker build -f src/main/docker/Dockerfile.native -t quarkus-started .
Sending build context to Docker daemon   24.4MB
Step 1/7 : FROM registry.access.redhat.com/ubi8/ubi-minimal:8.1
 ---> 91d23a64fdf2
Step 2/7 : WORKDIR /work/
 ---> Using cache
 ---> 7c9dd6e642dd
Step 3/7 : COPY target/*-runner /work/application
 ---> Using cache
 ---> ff893a0a9d8e
Step 4/7 : RUN chmod 775 /work /work/application   && chown -R 1001 /work   && chmod -R "g+rwX" /work   && chown -R 1001:root /work
 ---> Using cache
 ---> 329466472176
Step 5/7 : EXPOSE 8080
 ---> Using cache
 ---> 6176ea77e59b
Step 6/7 : USER 1001
 ---> Using cache
 ---> bea935cafe0c
Step 7/7 : CMD ["./application", "-Dquarkus.http.host=0.0.0.0"]
 ---> Using cache
 ---> 9c598f616452
Successfully built 9c598f616452
Successfully tagged quarkus-started:latest
```


Creamos un proyecto desde el cliente
```
$ oc new-project quarkus-started
Now using project "quarkus-started" on server "https://api.cluster-666-3005.666-3005.example.opentlc.com:6443".

You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app centos/ruby-25-centos7~https://github.com/sclorg/ruby-ex.git

to build a new example application in Ruby.
```

Creamos un nuevo Build
```
$ oc new-build --binary --name=quarkus-started -l app=quarkus-started
    * A Docker build using binary input will be created
      * The resulting image will be pushed to image stream tag "quarkus-started:latest"
      * A binary build was created, use 'start-build --from-dir' to trigger a new build

--> Creating resources with label app=quarkus-started ...
    imagestream.image.openshift.io "quarkus-started" created
    buildconfig.build.openshift.io "quarkus-started" created
--> Success
```

Definimos la estrategia y el docker file que vamos a usar
```
$ oc patch bc/quarkus-started -p '{"spec":{"strategy":{"dockerStrategy":{"dockerfilePath":"src/main/docker/Dockerfile.native"}}}}'
buildconfig.build.openshift.io/quarkus-started patched
```

Procedemos a iniciar el Buid
```
$ oc start-build quarkus-started --from-dir=. --follow
Uploading directory "." as binary input for the build ...
......
Uploading finished
build.build.openshift.io/quarkus-started-1 started
Receiving source from STDIN as archive ...
Caching blobs under "/var/cache/blobs".

Pulling image registry.access.redhat.com/ubi8/ubi-minimal:8.1 ...
Getting image source signatures
Copying blob sha256:218f593046abe6e9f194aed3fc2a2ad622065d6800175514dffa55dfce624b56
Copying blob sha256:b26afdf22be4e9c30220796780a297b91549a3b3041b6fdcbda71bf48a6912e7
Copying config sha256:91d23a64fdf259ffce4181b40ce3dafa982a9e4a76ae6a88c1e662c6166c7324
Writing manifest to image destination
Storing signatures
STEP 1: FROM registry.access.redhat.com/ubi8/ubi-minimal:8.1
STEP 2: WORKDIR /work/
3fd8e0eef4e6350e388195244635ed55aee91498ff6ba07423594b42e76560d1
STEP 3: COPY target/*-runner /work/application
ee10043015e9b57cda9559eb5dc660e9dedd29bff294970cf76edd64dcdd7152
STEP 4: RUN chmod 775 /work /work/application   && chown -R 1001 /work   && chmod -R "g+rwX" /work   && chown -R 1001:root /work
a0aaa60f31e79b6bb5b96fcdca4576275eabfc8a6f82f08168b65e919b1eebca
STEP 5: EXPOSE 8080
26bf118f9556176d68799ffda6a212140b7a49bb5d81628bbabd7d21480d808f
STEP 6: USER 1001
a9bdf0ae231ee4e6a9cd59736927f57f32223b86705bd5f135a8e8eab0340640
STEP 7: CMD ["./application","-Dquarkus.http.host=0.0.0.0"]
79c0297b53958d687688ca95cb1e95e1ac0beb88f7e8a119f5cb397e00bb48f0
STEP 8: ENV "OPENSHIFT_BUILD_NAME"="quarkus-started-1" "OPENSHIFT_BUILD_NAMESPACE"="quarkus-started"
fd53b1f4aa42e396bda0501f75b8fbff7ba904c9fda9d54e4963eae962a0c45a
STEP 9: LABEL "io.openshift.build.name"="quarkus-started-1" "io.openshift.build.namespace"="quarkus-started"
STEP 10: COMMIT temp.builder.openshift.io/quarkus-started/quarkus-started-1:d60701fd
871c5b07b6e9e13f68f2abfd32b3cf284b669158f4ef04a906af131f1a74ff4f
871c5b07b6e9e13f68f2abfd32b3cf284b669158f4ef04a906af131f1a74ff4f

Pushing image image-registry.openshift-image-registry.svc:5000/quarkus-started/quarkus-started:latest ...
Getting image source signatures
Copying blob sha256:b26afdf22be4e9c30220796780a297b91549a3b3041b6fdcbda71bf48a6912e7
Copying blob sha256:1ac07e990d8536bab6f281b3e6cda1104ffaa6e818adcea1db8c1829ebdf1f13
Copying blob sha256:571ff8400e65f2d6120e96d4f36c22ca2ac0603c8f3563345ae007432449bf91
Copying blob sha256:218f593046abe6e9f194aed3fc2a2ad622065d6800175514dffa55dfce624b56
Copying config sha256:871c5b07b6e9e13f68f2abfd32b3cf284b669158f4ef04a906af131f1a74ff4f
Writing manifest to image destination
Storing signatures
Successfully pushed image-registry.openshift-image-registry.svc:5000/quarkus-started/quarkus-started@sha256:9f224a89cbba271037b6f0c5d10102ff396099c8d8bdc79235e6b06179056ee6
Push successful
```

Una vez que la imagen se encuentra en el repositorio local, procedemos a crear una nueva app.
```
$ oc new-app --image-stream=quarkus-started:latest
--> Found image 871c5b0 (About a minute old) in image stream "quarkus-started/quarkus-started" under tag "latest" for "quarkus-started:latest"

    Red Hat Universal Base Image 8 Minimal
    --------------------------------------
    The Universal Base Image Minimal is a stripped down image that uses microdnf as a package manager. This base image is freely redistributable, but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products. This image is maintained by Red Hat and updated regularly.

    Tags: minimal rhel8

    * This image will be deployed in deployment config "quarkus-started"
    * Port 8080/tcp will be load balanced by service "quarkus-started"
      * Other containers can access this service through the hostname "quarkus-started"

--> Creating resources ...
    deploymentconfig.apps.openshift.io "quarkus-started" created
    service "quarkus-started" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose svc/quarkus-started'
    Run 'oc status' to view your app.
```

Exponemos el servicio
```
$ oc expose service quarkus-started
route.route.openshift.io/quarkus-started exposed
```

Y ya lo tenemos disponible, para crear el un servicio Serverless lo vamos a ver por la UI.


## Construccion de una Pipeline de Tekton


Al usar el CDR de K8s, el mismo es un archivo yaml asi que importamos una Task para ver su funcionamiento.

```
$ oc apply -f task-helloworld.yaml
error: unable to recognize "task-helloworld.yaml": no matches for kind "Task" in version "tekton.dev/v1alpha1"
```

Kustamos las tareas que figuran en el sistema.
```
$ tkn task ls
NAME               DESCRIPTION   AGE
echo-hello-world                 6 minutes ago
```

Podemos ejecutar por linea de comando
```
$ tkn task start echo-hello-world                              
Taskrun started: echo-hello-world-run-mqrxk                    
                                                               
In order to track the taskrun progress run:                    
tkn taskrun logs echo-hello-world-run-mqrxk -f -n quarkus-started                                                             
```       

Y en caso de necesitar verificar el logs procedemos de la siguiente manera:
```
$ tkn task logs echo-hello-world
[echo] hello world
```

 
Supongamos que queeremos invocar un Pipeline desde linea de comadno hacemos lo siguiente

 tkn pipeline start tdc-build-deploy \
 --param="mavenMirrorUrl=http://nexus3-kogito-tools.apps.kogito.automation.rhmw.io/repository/maven-public/"  \
 --param="kubernetesResourceFile=/workspace/source/quarkus-pipeline/src/main/kubernetes/Deployment.yml" \
 --resource="appSource=git-source" \
 --resource="appImage=bgc-image-blue" \
 //--serviceaccount="pipeline"
 

 
## Links de interes

-   http://www.mastertheboss.com/soa-cloud/quarkus/building-container-ready-native-applications-with-quarkus
- https://docs.openshift.com/container-platform/4.3/serverless/installing_serverless/installing-knative-eventing.html
- https://github.com/openshift/pipelines-tutorial
- https://github.com/openshift/pipelines-tutorial/blob/master/install-operator.md
- https://github.com/tektoncd/cli

## Expresiones de Gratitud 🎁

* Comenta a otros sobre este proyecto 📢
* Invita una cerveza 🍺 o un café ☕ a alguien del equipo. 
* Da las gracias públicamente 🤓.

---
⌨️ con ❤️ por [jose-franco](https://github.com/jose-franco) 😊