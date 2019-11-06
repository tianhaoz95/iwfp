import funcTest from 'firebase-functions-test';
import admin from 'firebase-admin';
import sinon from 'sinon';
import 'mocha';

describe('test iwfp api', () => {
  let iwfpapi, adminInitStub;
  const tester = funcTest();
  before(async () => {
    adminInitStub = sinon.stub(admin, 'initializeApp');
    iwfpapi = await import('../src/index');
  });

  after(() => {
    adminInitStub.restore();
    tester.cleanup();
  });

  it('hello world no crash', () => {
    const wrapped = tester.wrap(iwfpapi.helloWorld);
    wrapped(null);
  });
});