## **Overview**
This stack enables declarative management of ArgoCD **Application** resource for **MariaDB Operator** using **Terraform**. By defining it as code, we eliminate manual configuration in the ArgoCD UI, improving reliability, consistency, and repeatability.

The stack ensures:
- An **Application** resource is deployed, which in turn installs the **MariaDB Helm chart**.

## **Architecture**
1. **Terraform** provisions:
   - ArgoCD **Application** pointing to the MariaDB Helm chart.
2. ArgoCD syncs the Application and deploys **MariaDB** into the target namespace.


## **Usage**
1. Configure variables in configurations/mariadb-operator
     ```bash
   git clone https://bitbucket.telekom-mms.com/scm/frld/frld-helm.git
   ```
3. Navigate to the appropriate folder and perfom deployment
    ```bash
    cd stack/mariadb-operator
    terraform init
    terraform plan
    terraform apply
    ```

## Open point
- AppProject - how to ensure it is there? deploy it together with mariadb or in seperate stack?