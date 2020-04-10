---
to: app/<%=src%>/<%=name%>.tsx
---

import React, { useState } from "react";
import { graphql, commitMutation } from "react-relay";
import Environment from "../relay/environment";

const <%=Name%> = ({ history }: RouterProps) => {
  // useState's
  const [state, setState] = useState("");

  // mutation
  const mutation = graphql`
    mutation <%=Name%>Query($input: <%=nameMutation%>Input!) {
      <%=nameMutation%>(input: $input) {
        success
        error
      }
    }
  `;

  const registre = async (e: any) => {
    e.preventDefault();

    commitMutation(Environment, {
      mutation,
      variables: { input: { name, description } },
      onCompleted: (response: <%=Name%>QueryResponse, errors: any) => {
        if (errors) return console.log(errors);
        const result = response.<%=nameMutation%>;
        console.log(result)
      },
      onError: (err: string) => console.error(err)
    });
  };

  type ValueChange = {
    value: string;
  };

  type onChangeValue = {
    target: ValueChange;
  };

  return (
    <Container>
      
    </Container>
  );
};

export default <%=Name%>;

