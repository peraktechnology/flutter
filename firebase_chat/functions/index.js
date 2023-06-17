const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.myFunction = functions.firestore
    .document("chats/{message}")
    .onCreate((snapshot, context) => {
      console.log(snapshot.data());
      admin.messaging().sendToTopic("chats", {
        notification: {
          title: snapshot.data().username,
          body: snapshot.data().text,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      });
      return;
    });
