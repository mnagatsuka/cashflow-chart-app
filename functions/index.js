const functions = require("firebase-functions");
const {Datastore} = require("@google-cloud/datastore");
const datastore = new Datastore({
	projectId: 'cashflowapp-dev',
	keyFilename: 'YOUR_DATASTORE_CREDENTIAL_FILE_NAME.json'
});



// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.getPaymentList = functions.region("asia-northeast1")
    .https.onRequest((request, response) => {
      functions.logger.info("Get Payment List", {structuredData: true});
      const datastore = new Datastore({
        // projectId: "cashflowapp-dev",
      });
      console.log(datastore);
      // const query = datastore
      //     .createQuery("Payment")
      //     .order("paymentDate", {
      //       descending: true,
      //     });
      // const [payments] = await datastore.runQuery(query);
      // console.log("Payments:");
      // payments.forEach((payments) => {
      // console.log(payments);
      // });

      response.send("Get Payment List");
    });
