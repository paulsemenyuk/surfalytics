# Analyze the Data and Build Two Views

# Tableau Exercise: Carnegie Libraries Analysis

## Question 1: Which state has the most Carnegie public libraries?

To find out, create a bar chart using the **dimension** `State` and **measure** `Public Libraries`:

1. In the **Data pane**, `CTRL + click` **State** and **Public Libraries**.
2. On the far-right side of the toolbar, click **Show Me** to open the **Show Me menu**.
3. On the **Show Me menu**, click the **horizontal bars icon**.
4. Click **Show Me** again to close the **Show Me menu**.
5. Alternatively, to build the view using drag and drop:
   - Drag **State** to the Rows shelf.
   - Drag **Public Libraries** to the Columns shelf.
6. On the toolbar, click the **Sort Descending icon** to sort the values from highest to lowest.
7. Give your worksheet a title:
   - Double-click the tab **Sheet 1** and type a name for your view. For example: **Number of Public Libraries by State**.

**The state with the most Carnegie public libraries:** ____________________________

---

## Question 2: Which state was granted the most money to build libraries?

1. Click the **New Worksheet tab** to add a second worksheet.
2. Create a text table (also referred to as a crosstab):
   - Drag **State** to the Rows shelf.
   - Drag **Public Libraries** to the Text mark card.
3. Add more measures to the view:
   - Drag **Public Grants** and **Academic Libraries** to the Text mark card.
4. On the toolbar, use the drop-down to change from **Standard** to **Fit Width**:
   - This expands the view so you can read the column headings.
5. Hover your pointer over the **Total Amount of Grants** column header and click the **Sort Descending icon**.
6. Give your worksheet a title:
   - Double-click the tab **Sheet 2** and type a name for your view. For example: **Total Amount of Grants**.

**The state with the highest total amount of grant money:** _____________________

---

## Build a Dashboard

1. Click the **New Dashboard tab** to add a dashboard.
2. Under **Sheets**, drag the worksheet **Number of Public Libraries by State** to the dashboard on **Drop sheets here**.
3. Drag the worksheet **Total Amount of Grants** to the bottom half of the dashboard and drop it when you see the gray box.
4. On the **Number of Public Libraries by State** sheet, click the **Use as Filter button**.
5. Use `CTRL + click` to select both **Indiana** and **New York**:
   - Notice how the **Total Amount of Grants** sheet now displays only the results for Indiana and New York.
6. Name the dashboard:
   - **Carnegie Libraries in the US**
   - On the **Dashboard menu**, click **Show Title**.

---
