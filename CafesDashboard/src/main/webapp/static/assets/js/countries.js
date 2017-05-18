//var country_arr = new Array("");
//
//// States
//var s_a = new Array();
//        s_a[0] = "||",
//        s_a[1] = "Ad Dawhah|Al Ghuwayriyah|Al Jumayliyah|Al Khawr|Al Wakrah|Ar Rayyan|Jarayan al Batinah|Madinat ash Shamal|Umm Salal";
//s_a[2] = "'Ajman|Abu Zaby (Abu Dhabi)|Al Fujayrah|Ash Shariqah (Sharjah)|Dubayy (Dubai)|Ra's al Khaymah|Umm al Qaywayn";
//s_a[3] = "Ad Daqahliyah|Al Bahr al Ahmar|Al Buhayrah|Al Fayyum|Al Gharbiyah|Al Iskandariyah|Al Isma'iliyah|Al Jizah|Al Minufiyah|Al Minya|Al Qahirah|Al Qalyubiyah|Al Wadi al Jadid|As Suways|Ash Sharqiyah|Aswan|Asyut|Bani Suwayf|Bur Sa'id|Dumyat|Janub Sina'|Kafr ash Shaykh|Matruh|Qina|Shamal Sina'|Suhaj";
//
//function populateStates(countryElementId, stateElementId) {
//
//    var selectedCountryIndex = document.getElementById(countryElementId).selectedIndex;
//alert(selectedCountryIndex)
//    var stateElement = document.getElementById(stateElementId);
//
//    stateElement.length = 0; // Fixed by Julian Woods
//
//    var state_arr = s_a[selectedCountryIndex].split("|");
//
//    for (var i = 0; i < state_arr.length; i++) {
//        stateElement.options[stateElement.length] = new Option(state_arr[i],
//                state_arr[i]);
//    }
//}
//
//function populateCountries(countryElementId, stateElementId) {
//
//    $.ajax({
//        type : "GET",
//        contentType : "application/json",
//        url : CONTEXT + "/get-countries",
//        timeout : 100000,
//        success : function (data) {
//            console.log("SUCCESS: ", data);
//            for (var i = 0; i < data.length; i++) {
//                country_arr[i+1]=data[i].country;
//            }
//
//        },
//        error : function (e) {
//            console.log("ERROR: ", e);
//
//        },
//        done : function (e) {
//            console.log("DONE");
//            // enableSearchButton(true);
//        }
//    });
//
//    // given the id of the <select> tag as function argument, it inserts
//    // <option> tags
//    var countryElement = document.getElementById(countryElementId);
//
//    for (var i = 0; i < country_arr.length; i++) {
//        countryElement.options[countryElement.length] = new Option(
//                country_arr[i], country_arr[i]);
//    }
//
//    // Assigned all countries. Now assign event listener for the states.
//
//    if (stateElementId) {
//        countryElement.onchange = function () {
//            populateStates(countryElementId, stateElementId);
//        };
//    }
//}