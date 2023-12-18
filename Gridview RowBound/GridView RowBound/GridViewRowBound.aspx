<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridViewRowBound.aspx.cs" Inherits="GridView_RowBound_GridViewRowBound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GridView RowBound</title>

    <!--Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+J2Wk5vqXn3Fm/z2N1r8f6VZJ4T3Hdvh4kXG1j4fZ6IsU2f5" crossorigin="anonymous"></script>
    <!--AJAX JS-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!--Bootstrap JS-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="gridEmbDiv" runat="server" class="mt-5 mx-auto col-md-11">
            <div class="">
                <asp:GridView ShowHeaderWhenEmpty="true" ID="gridDynamicBOQ" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridDyanmic_RowDataBound"
                    CssClass="table table-bordered border border-1 border-dark-subtle table-hover text-center">
                    <HeaderStyle CssClass="align-middle table-primary" />
                    <Columns>
                        <asp:TemplateField ControlStyle-CssClass="col-xs-1" HeaderText="Sr.No">
                            <ItemTemplate>
                                <asp:HiddenField ID="id" runat="server" Value="id" />
                                <span>
                                    <%#Container.DataItemIndex + 1%>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BoqItem" HeaderText="Item Description" SortExpression="BoqItem" ReadOnly="true" ItemStyle-CssClass="col-xs-3 align-middle text-start fw-light" />
                        <asp:BoundField DataField="BoqUOM" HeaderText="UOM" SortExpression="BoqUOM" ReadOnly="true" ItemStyle-CssClass="col-xs-3 align-middle fw-light" />
                        <asp:BoundField DataField="BoqQty" HeaderText="BoQ Qty" SortExpression="BoqQty" ItemStyle-CssClass="col-xs-3 align-middle fw-light" />

                        <asp:TemplateField HeaderText="Qty Measured" ItemStyle-CssClass="col-xs-3 align-middle">
                            <ItemTemplate>
                                <asp:TextBox ID="QtyMeasure" runat="server" CssClass="col-md-12 fw-normal border border-dark-subtle shadow-sm rounded-1 px-2 py-1" type="number" Text='<%# Bind("QtyMeasure") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Upto Previous RA Qty" ItemStyle-CssClass="col-xs-3 fw-light align-middle">
                            <ItemTemplate>
                                <asp:TextBox ID="UptoPreRaQty" runat="server" Enabled="false" CssClass="col-md-12 border border-light-subtle shadow-sm rounded-2 px-2 py-1 bg-body-tertiary text-center" type="number" Text='<%# Bind("UptoPreRaQty") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Qty in Difference" ItemStyle-CssClass="col-xs-3 fw-light align-middle">
                            <ItemTemplate>
                                <asp:TextBox ID="QtyDiff" runat="server" Enabled="false" CssClass="col-md-12 border border-light-subtle shadow-sm rounded-2 px-2 py-1 bg-body-tertiary text-center" type="number" Text='<%# Bind("QtyDiff") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="BoqRate" HeaderText="BoQ Unit Rate" SortExpression="BoqRate" ReadOnly="true" ItemStyle-CssClass="col-xs-3 align-middle fw-light" />

                    </Columns>
                </asp:GridView>

                <div class="mt-5 mb-2">
                    <div class="text-end">
                        <asp:Button ID="btnBasicAmount" runat="server" Text="Calculate (Basic Amount)" OnClick="btnBasicAmount_Click" CssClass="btn btn-info mb-3" />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-9"></div>
                    <div class="col-md-3">
                        <div class="input-group shadow-sm">
                            <span class="input-group-text fs-5 fw-semibold">₹</span>
                            <asp:TextBox runat="server" ID="txtBasicAmt" CssClass="form-control fw-lighter border border-2" ReadOnly="true" placeholder="Total Basic Amount"></asp:TextBox>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
