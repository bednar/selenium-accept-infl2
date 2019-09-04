import { Then, When } from 'cucumber';
const bucketsSteps = require(__srcdir + '/steps/loadData/bucketsSteps.js');

let bktTabSteps = new bucketsSteps(__wdriver);

Then(/^the buckets are sorted as "(.*)"$/, async (bucketNames) => {
    await bktTabSteps.verifyOrderByName(bucketNames);
});

When(/^click the Create Bucket button$/, async () => {
    await bktTabSteps.clickCreateBucket();
});

Then(/^the Create Bucket Popup is loaded$/, async () => {
    await bktTabSteps.verifyCreateBucketPopup();
});

Then(/^the Create button of Create Bucket Popup is disabled$/, async () => {
    await bktTabSteps.verifyCreateBucketCreateButtonEnabled(false);
});

Then(/^the Create button of Create Bucket Popup is enabled$/, async () => {
    await bktTabSteps.verifyCreateBucketCreateButtonEnabled(true);
});

Then(/^the Retention Policy radio button "(.*)" is active$/, async (rp) => {
    await bktTabSteps.verifyActiveRetentionPolicyButton(rp);
});

Then(/^the Retention Policy radio button "(.*)" is inactive$/, async (rp) => {
   await bktTabSteps.verifyInactiveRetentionPolicyButton(rp);
});


//Waiting for dismissal can take a few secs
When(/^dismiss the Create Bucket Popup$/, {timeout: 2 * 5000}, async () => {
    await bktTabSteps.dismissBucketPopup();
});

When(/^dismiss the Edit Bucket Popup$/, {timeout: 2 * 5000}, async () => {
    await bktTabSteps.dismissBucketPopup();
});

// Should be not present - removed from DOM
Then(/^the Create Bucket Popup is not present$/, {timeout: 2 * 5000}, async () => {
    await bktTabSteps.verifyCreateBucketPopupNotPresent();
});

Then(/^the Edit Bucket Popup is not present$/, {timeout: 2 * 5000}, async () => {
    await bktTabSteps.verifyCreateBucketPopupNotPresent();
});

//Waiting for dismissal can take a few secs
When(/^cancel the Create Bucket Popup$/, {timeout: 2 * 5000}, async () => {
    await bktTabSteps.cancelBucketPopup();
});

When(/^cancel the Edit Bucket Popup$/, {timeout: 2 * 5000}, async () => {
    await bktTabSteps.cancelBucketPopup();
});

Then(/^the Retention Policy intervals controls are not present$/, {timeout: 2 * 5000}, async () => {
    await bktTabSteps.verifyRPIntervalControlsNotPresent();
});

Then(/^the Retention Policy intervals controls are present$/, async () => {
    await bktTabSteps.verifyRPIntervalControlsPresent();
});

When(/^click the Retention Policy "(.*)" button$/, async(rp) => {
    await bktTabSteps.clickRetentionPolicyButton(rp);
});

When(/^input the name of the bucket as "(.*)"$/, async (name) => {
    await bktTabSteps.setBucketName(name);
});

When(/^clear all Retention Policy interval controls$/, async () => {
   await bktTabSteps.clearAllRetentionPolicyIntervals();
});

When(/^enter "(.*)" into the Retention Policy "(.*)" control$/, async(amount, unit) => {
   await bktTabSteps.enterIntervalValue(amount, unit);
});

Then(/^the Retention Policy "(.*)" control contains the value "(.*)"$/, async(unit, value) => {
   await bktTabSteps.verifyIntervalValue(value, unit);
});


When(/^set the retention policy of the bucket as "(.*)"$/, async (rp) => {
    if(rp.toLowerCase() === 'never'){
        await bktTabSteps.clickRetentionPolicyButton('never');
    }else{
        rp = rp.trim();
        let policy = rp.split(" ");
        await bktTabSteps.clickRetentionPolicyButton('intervals');
        await bktTabSteps.enterIntervalValue(policy[0], policy[1]);
    }
});

When(/^click the Create Bucket popup Create button$/, async () => {
    await bktTabSteps.clickCreatePopupCreate();
});

Then(/^the Retention Policy warning message contains "(.*)"$/, async (msg) => {
    await bktTabSteps.verifyFormErrorMessageContains(msg);
});

Then(/^the Retention Policy warning message has disappeared$/, {timeout: 2 * 5000}, async () => {
   await bktTabSteps.verifyFormErrorMessageNotPresent();
});

Then(/^the bucket named "(.*)" is in the list$/, async (name) => {
   await bktTabSteps.verifyBucketInListByName(name);
});

Then(/^the bucket named "(.*)" has a Retention Policy of "(.*)"$/, async (name, rp) => {
    await bktTabSteps.verifyBucketHasRetentionPolicy(name, rp);
});

When(/^click on the bucket named "(.*)"$/, async (name) => {
   await bktTabSteps.clickOnBucketNamed(name);
});

Then(/^the Edit Bucket popup is loaded$/, async () => {
    await bktTabSteps.verifyEditBucketPopup();
});

Then(/^the name edit textbox of the Edit Bucket popup is disabled$/, async() => {
    await bktTabSteps.verifyNameInputEnabled(false);
});

Then(/^the form help text contains "(.*)"$/, async (text) => {
    await bktTabSteps.verifyPopupHelpText(text);
})

When(/^click Edit Bucket Popup Save Changes$/, async () => {
     await bktTabSteps.clickSaveChanges();
})