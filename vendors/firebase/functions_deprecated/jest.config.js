module.exports = {
  clearMocks: true,
  moduleFileExtensions: ["js", "ts", "node", "json"],
  testEnvironment: "node",
  testMatch: ["**/*.test.ts"],
  testRunner: "jest-circus/runner",
  transform: {
    "^.+\\.(ts|tsx)?$": "ts-jest",
  },
  verbose: true,
};
