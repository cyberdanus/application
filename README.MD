### Changes in the application

<details><summary>added code to application/app/index.ts</summary>

```ts
const express = require('express')
const metrics = require('express-prometheus-metrics')
const app = express();

app.use(
  metrics({
    metricsPath: '/metrics',
    interval: 60 * 1000,
    excludeRoutes: [],
    requestDurationBuckets: [0.5, 0.9, 0.95, 0.99],
    requestDurationHistogramBuckets: [0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2.5, 5, 10],
    requestSizeBuckets: [5, 10, 25, 50, 100, 250, 500, 1000, 2500, 5000, 10000],
    responseSizeBuckets: [5, 10, 25, 50, 100, 250, 500, 1000, 2500, 5000, 10000],
  }),
)
```

</details></br>

* Created Dockerfile to build image
