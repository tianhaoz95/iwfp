# Firebase Service

The cloud functions has been taken out in favor of lower cost Vercel solution. To add it back, include the following code in `firebase.json`:

```json
"functions": {
    "predeploy": [
        "npm --prefix \"$RESOURCE_DIR\" run lint",
        "npm --prefix \"$RESOURCE_DIR\" run build"
    ]
}
```
