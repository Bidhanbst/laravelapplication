# Deploy Application
## First of all enable multi architecture docker build.
<pre> \`\`\`bash // docker buildx create --use && docker buildx inspect —bootstrap \`\`\` </pre>

## Build the docker image using following command
<pre> \`\`\`bash // docker buildx build --platform linux/amd64,linux/arm64 -t imagename:tag --push . \`\`\` </pre>

## Set up NFS server for Persistent Volume Storage
Follow the ansible guide to create NFS server

## Under k8s/application folder apply the yaml for an application
<pre> \`\`\`bash // kubectl apply -f deployment.yaml \`\`\` </pre>
<pre> \`\`\`bash // kubectl apply -f horizontalpodautoscaler.yaml \`\`\` </pre>
<pre> \`\`\`bash // kubectl apply -f services.yaml \`\`\` </pre>

## Under k8s/database folder apply the yaml for a database
<pre> \`\`\`bash // kubectl apply -f database-service.yaml \`\`\` </pre>
<pre> \`\`\`bash // kubectl apply -f database.yaml \`\`\` </pre>
<pre> \`\`\`bash // kubectl apply -f persistentvolume.yaml \`\`\` </pre>
<pre> \`\`\`bash // kubectl apply -f persistentvolumeclaim.yaml \`\`\` </pre>
<pre> \`\`\`bash // kubectl apply -f storage.yaml \`\`\` </pre>