import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
    stages: [
        { duration: '5s', target: 10 },
        { duration: '30s', target: 10 },
        { duration: '5s', target: 100 },
        { duration: '30s', target: 100 },
        { duration: '5s', target: 10 },
        { duration: '30s', target: 10 },
        { duration: '5s', target: 0 },
    ],
    thresholds: {
        http_req_duration: ['p(90)<5000'],
    },
};

export default () => {
    http.get("http://localhost:5235/home/index");
    sleep(1);
};