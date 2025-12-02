# Deploying BentaHub to GitHub Pages

Follow these steps to publish your BentaHub POS app on GitHub Pages for free.

## Step 1: Download Your Project

1. In Replit, click the three dots menu (⋮) next to "Files"
2. Select "Download as zip"
3. Extract the zip file on your computer
4. **IMPORTANT**: Open the extracted folder and find the **BentaHubPlan** folder inside. You'll upload the contents of THIS folder to GitHub.

## Step 2: Create a GitHub Repository

1. Go to [github.com](https://github.com) and sign in (or create an account)
2. Click the **+** icon in the top right and select **New repository**
3. Name it `bentahub` (or any name you prefer)
4. Keep it **Public** (required for free GitHub Pages)
5. **DO NOT** check "Add a README file" - leave it empty
6. Click **Create repository**

## Step 3: Upload Your Code

**IMPORTANT**: You need to upload the files that are INSIDE the `BentaHubPlan` folder, not the folder itself.

Your uploaded files should look like this at the root of your GitHub repo:
```
.github/
  workflows/
    deploy.yml
client/
server/
shared/
package.json
vite.config.ghpages.ts
... (other files)
```

**Option A: Using GitHub Web (Easiest)**
1. On your new empty repository page, click "uploading an existing file"
2. Drag and drop ALL the files from INSIDE the BentaHubPlan folder
3. Make sure .github folder is included (you may need to show hidden files)
4. Click "Commit changes"

**Option B: Using GitHub Desktop**
1. Download [GitHub Desktop](https://desktop.github.com/)
2. Clone your new repository
3. Copy all files from INSIDE the BentaHubPlan folder into the cloned folder
4. Commit and push

**Option C: Using Command Line**
```bash
# Navigate INTO the BentaHubPlan folder first
cd your-extracted-folder/BentaHubPlan
git init
git add .
git commit -m "Initial commit - BentaHub POS"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/bentahub.git
git push -u origin main
```

## Step 4: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** tab
3. Click **Pages** in the left sidebar
4. Under **Build and deployment** > **Source**, select **GitHub Actions**
5. The deployment will start automatically!

## Step 5: Access Your App

After a few minutes, your app will be live at:
```
https://YOUR_USERNAME.github.io/bentahub/
```

You can find the exact URL in:
- Repository → Settings → Pages
- Or in the Actions tab after deployment completes

## Updating Your App

Any time you push changes to the `main` branch, GitHub will automatically rebuild and deploy your app.

## Troubleshooting

**Assets not loading?**
- Make sure the `base` in `vite.config.ghpages.ts` matches your repo name

**404 on page refresh?**
- This is normal for single-page apps. The app uses client-side routing which handles this.

**Build failed?**
- Check the Actions tab for error logs
- Make sure all dependencies are listed in `package.json`

## Alternative: Use Replit Deployments

If GitHub Pages seems complicated, you can also publish directly from Replit:
1. Click the **Deploy** button in Replit
2. Choose "Static" deployment
3. Your app will be live instantly with a `.replit.app` domain

---

Congratulations on completing your Design Thinking project! 🎉
