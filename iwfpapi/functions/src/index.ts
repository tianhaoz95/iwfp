import * as functions from 'firebase-functions';

export const helloWorld = functions.https.onCall((data, context) => {
  return new Promise((resolve, reject) => {
    resolve('Hello from iwfpapi!');
  });
});