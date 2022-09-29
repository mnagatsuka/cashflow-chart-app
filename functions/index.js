const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.getPaymentList = functions.region("asia-northeast1")
    .https.onRequest(async (request, response) => {
      functions.logger.info("Get Payment List", {structuredData: true});
      data = [];
      try {
        const querySnapshot = await db.collection("Payment").get();
        querySnapshot.forEach((doc) => {
          data.push({
            id: doc.id,
            category: doc.category,
            amount: doc.amount,
            ...doc.data()
          });
        });
        response.send({
          message: "Get Payment List",
          data: data
        });  
      } catch (error) {
        console.log(error);
        response.send(error);
      }
    });
