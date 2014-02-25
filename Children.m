//
//  Children.m
//  TestDatabase
//
//  Created by Test on 10/18/13.
//  Copyright (c) 2013 Test. All rights reserved.
//

#import "Children.h"
#import <sqlite3.h>
#import "ConnectionDB.h"

@implementation Children

//Check Physician Exist or not

+(BOOL) PhysicianExistwithID:(NSString *)pID
{
    //Make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT count(pID) FROM Physicians WHERE pID = '%@'", pID];
    
    sqlite3_stmt *sqlStatement;
    bool found = NO;
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            if ([[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 0)]  isEqual: @"1"])
                found = YES;
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    
    return found;
    
}

+(NSString *)GetPhysicianNameByID:(NSString *)pID
{
    //Make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT firstName, lastName FROM Physicians WHERE pID = %@", pID];
    
    sqlite3_stmt *sqlStatement;
    NSString *name = @"";
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            name = [NSString stringWithFormat:@"%@ %@", [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 0)], [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)]];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    
    return name;

}

// SEARCH CHILDREN

+(NSMutableArray *) Search:(NSMutableDictionary *)searchInfo
{
    //Make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    // Set up SQL
    NSArray *searchInfoKey = [searchInfo allKeys];
    bool flag = NO;
    NSString *sql = @"SELECT C.cID, C.firstName, C.lastName, C.DOB, C.returnDate, C.motherName FROM Children C";
    
    if (![[searchInfo valueForKey:@"cID"]  isEqual: @""])
    {
        sql = [NSString stringWithFormat:@"%@ WHERE C.cID = '%@'", sql, [searchInfo objectForKey:@"cID"]];
        flag = YES;
    }
    
    for (int i = 1; i <[searchInfoKey count]; ++i)
    {
        if(![[searchInfo valueForKey:[searchInfoKey objectAtIndex:i]]  isEqual: @""])
        {
            if (flag == NO)
            {
                sql = [NSString stringWithFormat:@"%@ WHERE C.%@ like '%%%@%%'", sql, [searchInfoKey objectAtIndex:i],[searchInfo objectForKey:[searchInfoKey objectAtIndex:i]]];
                flag  = YES;
            }
            else
                sql = [NSString stringWithFormat:@"%@ and C.%@ like '%%%@%%'", sql, [searchInfoKey objectAtIndex:i],[searchInfo objectForKey:[searchInfoKey objectAtIndex:i]]];
        }
    }
    
    //Get Data from DB
    sqlite3_stmt *sqlStatement;
    NSMutableArray *resultList = [[NSMutableArray alloc] init];
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            NSMutableArray *result = [[NSMutableArray alloc] init];
            for (int i = 0; i <6; ++i)
            {
                [result addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, i)]];
            }
            
            [resultList addObject:result];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    sqlite3_close(db);
    return resultList;
}


//GET CHILDREN INFORMATION

+(NSMutableArray *) GetChildInfomation: (NSString *)childID
{
    //Make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT C.cID, C.firstName, C.lastName, C.DOB, C.gender, C.placeOfBirth, C.allergies, C.returnDate, C.motherName, C.fatherName, C.address, C.city, C.state, C.zipCode, C.emergencyContact, C.emergencyPhoneNo, P.firstName, P.lastName, P.phoneNumber, P.clinic, C.physicianID, C.middleInitial FROM Children C, Physicians P WHERE C.cID = '%@' and C.physicianID = P.pID", childID];
    
    sqlite3_stmt *sqlStatement;
    NSMutableArray *result= [[NSMutableArray alloc] init];
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            for (int i = 0; i < 22; ++i)
            {
                [result addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, i)]];
            }
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    
    return result;
}

// GET CHILDREN RECORD

+(NSMutableArray *) GetChildRecord:(NSString *) childID ageRange: (NSString *) ageRange
{
    //Connect to DB
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT R.recordID, R.vacineName, R.description, R.takenDate, P.firstName, P.lastName, P.clinic, C.note FROM Record R, Physicians P, Children C WHERE R.childrenID ='%@' and R.ageRange like '%@' and R.childrenID = C.cID and R.physicianID = P.pID", childID, ageRange];
    
    //Get data from DB
    
    sqlite3_stmt *sqlStatement;
    NSMutableArray *resultList= [[NSMutableArray alloc] init];
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            NSMutableArray *result= [[NSMutableArray alloc] init];
            for (int i = 0; i <8; ++i)
            {
                [result addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, i)]];
            }
            [resultList addObject:result];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);

    return resultList;
}

//GET DETAIL RECORD

+(NSMutableArray *) GetDetailRecordByRecordID:(NSString *) recordID childID:(NSString *)childID growPeriod: (NSString *)growthPeriod
{
    //Connect to DB
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT R.childrenID, C.firstName, C.lastName, P.firstName, P.lastName, R.vacineName, R.description, R.ageRange, R.takenDate, C.returnDate, R.physicianID FROM Record R, Physicians P, Children C WHERE R.childrenID ='%@' and R.recordID = '%@' and R.ageRange like '%@' and R.physicianID = P.pID and R.childrenID = C.cID", childID, recordID, growthPeriod];
    
    //Get data from DB
    
    sqlite3_stmt *sqlStatement;
    NSMutableArray *result= [[NSMutableArray alloc] init];
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            for (int i = 0; i < 11; ++i)
            {
                [result addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, i)]];
            }
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    return result;
}

//GET NOTE

+(NSString *) GetNoteByChildID: (NSString *) childID
{
    //Connect to DB
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT C.note FROM Children C WHERE cID ='%@' ", childID];
    
    //Get data from DB
    
    sqlite3_stmt *sqlStatement;
    NSString *note= @"";
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            note = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 0)];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    
    return note;
}

//EDIT CHILDREN INFORMATION

+(NSString *) EditChildInformation:(NSString *) tableName childID:(NSString *) childID ageRange:(NSString *) ageRange recordID:(NSString *) recordID newInfo: (NSMutableDictionary *) newInfo
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQl
    NSArray *key = [newInfo allKeys];
    bool flag = NO;
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET", tableName];
    for (int i = 0; i <[key count]; ++i)
    {
        if (![[newInfo valueForKey:[key objectAtIndex:i]]  isEqual: @""])
        {
            if (flag == NO)
            {
                sql = [NSString stringWithFormat:@"%@ %@ = '%@'", sql,[key objectAtIndex:i],[newInfo objectForKey:[key objectAtIndex:i]]];
                flag = YES;
            }
            else
            {
                sql = [NSString stringWithFormat:@"%@, %@ = '%@'", sql,[key objectAtIndex:i],[newInfo objectForKey:[key objectAtIndex:i]]];            }
        }
    }
    if ([tableName isEqualToString:@"Children"])
    {
        sql = [NSString stringWithFormat:@"%@ WHERE cID = '%@'", sql, childID];
    }
    else if ([tableName isEqualToString:@"Record"])
    {
        sql = [NSString stringWithFormat:@"%@ WHERE childrenID = '%@' and ageRange like '%@' and recordID = '%@'", sql, childID, ageRange, recordID];
    }
    
    // Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
            message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }

    sqlite3_close(db);
    return message;
}

//CREATE NEW DATA FOR CHILDREN
+(NSString *) CreateNewChildInformation:(NSString *) tableName newData:(NSMutableArray *) newData
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set sql
    NSString *sql = @"";
    if([tableName isEqualToString:@"Record"])
        sql = [NSString stringWithFormat:@"INSERT INTO %@ (vacineName, description, takenDate, ageRange, childrenID, physicianID) VALUES('%@'", tableName, [newData objectAtIndex:0]];
    else
        sql = [NSString stringWithFormat:@"INSERT INTO %@ VALUES('%@'", tableName, [newData objectAtIndex:0]];
    
    for(int i = 1; i < [newData count]; ++i)
    {
        sql = [NSString stringWithFormat:@"%@, '%@'", sql, [newData objectAtIndex:i]];
    }
    sql = [NSString stringWithFormat:@"%@)", sql];
    
    //Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
             message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    sqlite3_close(db);
    return message;
}

+(void) DeleteChildInfo:(NSString *) tableName id:(NSString*)identifier
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set sql
    NSString *sqlChildren = [NSString stringWithFormat:@"DELETE FROM Children WHERE cID ='%@'", identifier];
    NSString *sqlRecord =@"";
    
    if([tableName isEqualToString:@"Record"])
    {
        sqlRecord = [NSString stringWithFormat:@"DELETE FROM Record WHERE recordID = '%@'", identifier];
    }
    else if ([tableName isEqualToString:@"Children"])
    {
        sqlRecord = [NSString stringWithFormat:@"DELETE FROM Record WHERE childrenID = '%@'", identifier];
    }
    
    //Execute sql
    sqlite3_stmt *sqlStatement;
    if([tableName isEqualToString:@"Record"])
    {
        if(sqlite3_prepare_v2(db, [sqlRecord UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
        {
            if(SQLITE_DONE != sqlite3_step(sqlStatement))
                NSLog(@"Error while updating. %s", sqlite3_errmsg(db));
        }
    }
    else if ([tableName isEqualToString:@"Children"])
    {
        if(sqlite3_prepare_v2(db, [sqlRecord UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
        {
            if(SQLITE_DONE != sqlite3_step(sqlStatement))
                NSLog(@"Error while updating. %s", sqlite3_errmsg(db));
        }
        
        if(sqlite3_prepare_v2(db, [sqlChildren UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
        {
            if(SQLITE_DONE != sqlite3_step(sqlStatement))
                NSLog(@"Error while updating. %s", sqlite3_errmsg(db));
        }
    }
    
    sqlite3_close(db);
}

//ADD A NEW RECORD

+(NSString *) AddNewRecordByChildrenID:(NSString *) childID andVaccineName:(NSString *)vaccineName andDescription:(NSString *)description andAgeRange:(NSString *) ageRange;
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set sql
    NSString *sql = [NSString stringWithFormat: @"INSERT INTO Record (vacineName, description, takenDate, ageRange, taken, childrenID, physicianID) VALUES ('%@', '%@', '', '%@', 'N', '%@', '')", vaccineName, description, ageRange,childID];
    
    //Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
            message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    //NSLog(@"message in data: %@", message);
    sqlite3_close(db);
    return message;
}

//EDIT RECORD

+(NSString *)EditRecordByChildID:(NSString *) childID andAgeRange:(NSString *)ageRange andVaccineName:(NSString *)vaccineName andDescription:(NSString *)description andTakenDate:(NSString *)takenDate andTaken:(NSString *)taken andPhysician:(NSString *)pID;
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQl
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE Record SET vacineName = '%@', description = '%@', takenDate = '%@', ageRange = '%@', taken = '%@', childrenID = '%@', physicianID = '%@' WHERE childrenID = '%@' and ageRange like '%@' and vacineName = '%@'", vaccineName, description, takenDate, ageRange, taken, childID, pID, childID, ageRange, vaccineName];
    
    // Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
            message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    sqlite3_close(db);
    return message;
    
}

// GET CHILDREN RECORD

+(NSMutableArray *) GetChildRecordByChildID:(NSString *) childID ageRange: (NSString *) ageRange
{
    //Connect to DB
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT R.recordID, R.vacineName, R.description, R.takenDate, R.ageRange, R.taken, R.childrenID, R.physicianID, P.clinic, P.firstName,P.lastName FROM Record R, Physicians P WHERE R.childrenID ='%@' and R.ageRange like '%@' and R.physicianID = P.pID", childID, ageRange];
    //Get data from DB
    
    sqlite3_stmt *sqlStatement;
    NSMutableArray *resultList= [[NSMutableArray alloc] init];
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            NSMutableArray *result= [[NSMutableArray alloc] init];
            for (int i = 0; i <11; ++i)
            {
                [result addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, i)]];
            }
            [resultList addObject:result];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    return resultList;
}

//ADD A NOTE

+(NSString *) AddNoteByChildID:(NSString *) childID andAgeRange:(NSString *)ageRange
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set sql
    NSString *sql = [NSString stringWithFormat: @"INSERT INTO MileStoneNote (note, ageRange, childrenID) VALUES ('', '%@', '%@')", ageRange,childID];
    
    //Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
            message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    //NSLog(@"message in data: %@", message);
    sqlite3_close(db);
    return message;
}

//EDIT A NOTE

+(NSString *) EditNoteByChildID:(NSString *) childID andAgeRange:(NSString *)ageRange andNewNote:(NSString *)note
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQl
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE MileStoneNote SET note = '%@', ageRange = '%@', childrenID = '%@' WHERE childrenID = '%@' and ageRange like '%@' ", note, ageRange, childID, childID, ageRange];
    
    // Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
            message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    //NSLog(@"message: %@", message);
    sqlite3_close(db);
    return message;
}

//GET NOTE
+(NSString *) GetNoteByChildID:(NSString *)childID andAgeRange:(NSString *)ageRange
{
    //Connect to DB
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT note FROM MileStoneNote WHERE childrenID ='%@' and ageRange like '%@'", childID, ageRange];
    
    //Get data from DB
    
    sqlite3_stmt *sqlStatement;
    NSString *note= @"";
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            note = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 0)];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    
    return note;
}

+(NSMutableArray *)GetRecordIDForAdditionalVaccineByChildrenID: (NSString *)childID
{
    //Make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT recordID FROM Record WHERE childrenID = '%@' and ageRange like 'ADDITIONAL VACCINE'", childID];
    
    sqlite3_stmt *sqlStatement;
    NSMutableArray *result= [[NSMutableArray alloc] init];
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            [result addObject: [NSString stringWithFormat:@"%i", sqlite3_column_int(sqlStatement, 0)]];

        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    return result;
}

+(void)EditRecordForAdditionalVaccineByRecordID: (NSString *)recordID andChildrenID:(NSString *)childID andVaccineName:(NSString *)vaccineName andDescription:(NSString *)description andTakenDate:(NSString *)takenDate andTaken:(NSString *)taken andPhysician:(NSString *)pID
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQl
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE Record SET vacineName = '%@', description = '%@', takenDate = '%@', taken = '%@', physicianID = '%@' WHERE recordID = %@ and childrenID = '%@' and ageRange like 'ADDITIONAL VACCINE'", vaccineName, description, takenDate, taken, pID, recordID,childID];
    // Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
            message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    sqlite3_close(db);
}

+(NSMutableArray *)GetAdditionalRecordByChildID:(NSString *)childID
{
    //Connect to DB
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT vacineName, description, takenDate, taken, physicianID FROM Record WHERE childrenID = '%@' and ageRange like 'ADDITIONAL VACCINE'", childID];
    
    //Get data from DB
    
    sqlite3_stmt *sqlStatement;
    NSMutableArray *resultList= [[NSMutableArray alloc] init];
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            NSMutableArray *result= [[NSMutableArray alloc] init];
            for (int i = 0; i <5; ++i)
            {
                [result addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, i)]];
            }
            [resultList addObject:result];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    return resultList;
}

+(NSString *)GetPhysicianClinicByPhysicianID:(NSString *)pID
{
    //Make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT clinic FROM Physicians WHERE pID = %@", pID];
    
    sqlite3_stmt *sqlStatement;
    NSString *clinic = @"";
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            clinic = [NSString stringWithFormat:@"%@ ", [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 0)]];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    
    return clinic;
}
+(void)UpdateReturnDateByChildrenID:(NSString*)childID andReturnDate:(NSString *)returnedDate
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQl
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE Children SET returnDate = '%@' WHERE cID = '%@'", returnedDate, childID];
    //NSLog(@"SQL: %@", sql);
    
    // Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
            message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    sqlite3_close(db);
}

+(void)AddGrowthByChildID:(NSString *)cID
{
    NSMutableArray *range = [[NSMutableArray alloc]initWithObjects:@"BIRTH", @"6 WEEKS", @"10 WEEKS", @"14 WEEKS", @"9-12 MONTHS", @"15-18 MONTHS", @"2-19 YEARS", nil];
    
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    for (NSString *ageRange in range)
    {
        NSString *sql = [NSString stringWithFormat: @"INSERT INTO Growth VALUES ('%@', '%@', '', '', '')", cID, ageRange];
        
        //Execute sql
        sqlite3_stmt *sqlStatement;
        NSString *message = @"";
        if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
        {
            if(SQLITE_DONE != sqlite3_step(sqlStatement))
                message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
            else
                message = @"Successfully";
        }
        else
        {
            NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
        }
    }
    sqlite3_close(db);
}

+(NSMutableArray *) GETGrowthByChildID:(NSString *) cID
{
    //Connect to DB
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQL
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM Growth WHERE childrenID = '%@'", cID];
    //Get data from DB
    
    sqlite3_stmt *sqlStatement;
    NSMutableArray *resultList= [[NSMutableArray alloc] init];
    if(sqlite3_prepare_v2(db, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(sqlStatement) == SQLITE_ROW)
        {
            NSMutableArray *result= [[NSMutableArray alloc] init];
            for (int i = 0; i <5; ++i)
            {
                [result addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, i)]];
            }
            [resultList addObject:result];
        }
    }
    else{
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    sqlite3_close(db);
    return resultList;
}

+(void)UPdateGrowthByChildrenID:(NSString *)cID andAgeRange:(NSString *)ageRange andHeight:(NSString *)height andWeight:(NSString *)weight andHeadSize:(NSString *)headSize
{
    //make connection
    sqlite3 *db = NULL;
    db = [ConnectionDB Connection];
    
    //Set SQl
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE Growth SET height = '%@', weight = '%@', headSize = '%@' WHERE childrenID = '%@' and ageRange like '%@'", height, weight, headSize, cID, ageRange];
    //NSLog(@"SQL: %@", sql);
    
    // Execute sql
    sqlite3_stmt *sqlStatement;
    NSString *message = @"";
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &sqlStatement, NULL) == SQLITE_OK)
    {
        if(SQLITE_DONE != sqlite3_step(sqlStatement))
            message = [NSString stringWithFormat:@"%s", sqlite3_errmsg(db)];
        else
            message = @"Successfully";
    }
    else
    {
        NSLog(@"Problem with prepare statement: %s", sqlite3_errmsg(db));
    }
    
    sqlite3_close(db);

}


@end
