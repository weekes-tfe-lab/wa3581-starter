# wa3581-starter

# Understanding the Lab Repository Structure

For this course, labs are in subdirs (`lab01/`, `lab02/`, etc.) within one Git repo (`wa3581-starter`). You will fork this repo and commit your work there.

Why this structure?  
- **Simplicity:** All materials + work in one place, easy to navigate/manage w/ checkpoints or solutions.  
- **Focus:** Labs target specific Terraform concepts w/o multi-repo overhead.

HCP Workspaces link?  
In prior step, HCP Workspace’s **Terraform Working Directory** was set to `lab01/`. HCP only scans that subdir for Terraform code/runs based on changes in your fork.

Real-world comparison:  
In production, HCP Workspace often ties to:  
- **Entire repo:** Polyrepo style, e.g., `networking-prod` workspace → `company-networking.git` (root dir).  
- **Top-level dir in monorepo:** e.g., `payment-app-prod` workspace → `company-mono-repo.git` w/ dir `apps/payment-service/production/`.

Lab setup mimics this by scoping HCP to `labXX/`, letting you practice VCS workflow in a simplified way. Key to grasp for real-world use.