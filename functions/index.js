const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

// exports.helloWorld = functions.https.onRequest((req, res) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   res.send("Hello from Firebase!");
// });

exports.getPaymentList = functions.region("asia-northeast1")
    .https.onRequest(async (req, res) => {
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
        res.send({
          message: "Get Payment List",
          data: data
        });  
      } catch (error) {
        console.log(error);
        res.send(error);
      }
    });

exports.getPaymentById = functions.region("asia-northeast1")
    .https.onRequest(async (req, res) => {
      functions.logger.info("Get Payment by Id", { structuredData: true });
      const strId = req.query.id;
      const id = Number(strId);
      // console.log(`query: ${req.query.id}`);
      console.log(`id: ${id}`);
      data = [];
      try {
        const querySnapshot = await db.collection("Payment").where("id", "==", id).get();
        querySnapshot.forEach( (doc) => {
          data.push({
            id: doc.id,
            category: doc.category,
            amount: doc.amount,
            ...doc.data()
          });
        });
        res.send({
          message: "Get Payment by Id",
          data: data
        });  
      } catch (error) {
        console.log(error);
        res.send(error);
      }
    });

exports.createPayment = functions.region("asia-northeast1")
    .https.onRequest(async (req, res) => {
      const { category, amount, paymentDate } = req.body;
      const createdAt = new Date().toISOString();
      try {
        const docRef = await db
          .collection("Payment")
          .add({
            category,
            amount,
            paymentDate,
            createdAt,
          });
        const querySnapshot = await docRef.get();
        const createdPayment = {
          id: querySnapshot.id,
          ...querySnapshot.data(),
        }
        res.send({
          message: "Create Payment",
          data: createdPayment
        });  
      } catch (error) {
        console.log(error);
        res.send(error);
      }
    });